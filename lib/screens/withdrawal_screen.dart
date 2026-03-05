import 'package:flutter/material.dart';
import 'package:mobile_rewards_app/services/payout_service.dart';

class WithdrawalScreen extends StatefulWidget {
  final String authToken; // pass current user auth token

  WithdrawalScreen({required this.authToken});

  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final _amountController = TextEditingController();
  String _method = 'paypal'; // 'paypal' or 'gcash'
  final _destinationController = TextEditingController();
  bool _loading = false;
  String? _message;

  void _submit() async {
    final amountText = _amountController.text;
    final destination = _destinationController.text.trim();
    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      setState(() => _message = 'Enter a valid amount.');
      return;
    }
    if (destination.isEmpty) {
      setState(() => _message = 'Enter payout destination details.');
      return;
    }

    setState(() {
      _loading = true;
      _message = null;
    });

    try {
      final resp = await PayoutService.requestWithdrawal(
        token: widget.authToken,
        amount: amount,
        method: _method,
        destination: destination,
      );
      setState(() {
        _message = 'Withdrawal requested: ${resp['id'] ?? 'pending'}';
      });
    } catch (e) {
      setState(() {
        _message = 'Error requesting withdrawal: $e';
      });
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Request Withdrawal')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount (PHP / USD)'),
            ),
            SizedBox(height: 12),
            DropdownButton<String>(
              value: _method,
              items: [
                DropdownMenuItem(child: Text('PayPal'), value: 'paypal'),
                DropdownMenuItem(child: Text('GCash'), value: 'gcash'),
              ],
              onChanged: (v) => setState(() => _method = v!),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: _method == 'paypal'
                    ? 'PayPal email (example@domain.com)'
                    : 'GCash mobile number (e.g. 09XXXXXXXXX)',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loading ? null : _submit,
              child: _loading ? CircularProgressIndicator() : Text('Request'),
            ),
            if (_message != null) ...[
              SizedBox(height: 12),
              Text(_message!, style: TextStyle(color: Colors.red)),
            ],
          ]),
        ));
  }
}