import 'package:cobrador_v2/classes/cashflow.dart';
import 'package:cobrador_v2/controller/cashflow_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewEditCashflow extends StatefulWidget {
  @override
  _NewEditCashflowState createState() => _NewEditCashflowState();

  bool edit;
  Function() refreshHome;
  String? type;
  Cashflow? cashflow;

  NewEditCashflow({Key? key, required this.edit, required this.refreshHome,this.cashflow, this.type})
      : super(key: key);
}

class _NewEditCashflowState extends State<NewEditCashflow> {
  TextEditingController controllerPersonName = TextEditingController();
  TextEditingController controllerValue = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  late FocusNode inputFieldNode;
  bool validPersonName = true;
  bool validValue = true;

  @override
  void initState() {
    super.initState();
    if(widget.edit){
      controllerPersonName.text = widget.cashflow!.personName;
      controllerValue.text = widget.cashflow!.value.toStringAsFixed(2);
      controllerNote.text = widget.cashflow!.note!;
    }
  }

  Future<void> saveCashflow() async {
    save(Cashflow(
      personName: controllerPersonName.text,
      type: widget.type!,
      value: double.parse(controllerValue.text),
      note: controllerNote.text,
    ));
  }

  Future<void> updateCashflow() async {
    update(Cashflow(
      id: widget.cashflow!.id,
      personName: controllerPersonName.text,
      type: widget.cashflow!.type,
      value: double.parse(controllerValue.text),
      note: controllerNote.text,
    ));
  }

  bool validateTextFields() {
    bool ok = true;
    if (controllerPersonName.text.isEmpty) {
      ok = false;
      validPersonName = false;
    }
    if (controllerValue.text.isEmpty) {
      ok = false;
      validValue = false;
    }
    return ok;
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        title: widget.edit ? const Text('Edit') : const Text('New'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Save',
            onPressed: () {
              if (validateTextFields()) {
                if (widget.edit) {
                  updateCashflow();
                } else {
                  saveCashflow();
                }
                widget.refreshHome();
                Navigator.of(context).pop();
              } else {
                setState(() {
                  validPersonName;
                  validValue;
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              autofocus: widget.edit ? false : true,
              minLines: 1,
              maxLines: 3,
              maxLength: 200,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              controller: controllerPersonName,
              onEditingComplete: () => node.nextFocus(),
              decoration: InputDecoration(
                  helperText: "* Required",
                  labelText: "Person name",
                  errorText: validPersonName ? null : "Person name is empty"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              minLines: 1,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onEditingComplete: () => node.nextFocus(),
              controller: controllerValue,
              decoration: InputDecoration(
                  labelText: "Value",
                  helperText: "* Required",
                  errorText: validValue ? null : "Value is empty"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              minLines: 1,
              maxLines: null,
              maxLength: 500,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.name,
              controller: controllerNote,
              onEditingComplete: () => node.nextFocus(),
              decoration: const InputDecoration(
                labelText: "Note",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
