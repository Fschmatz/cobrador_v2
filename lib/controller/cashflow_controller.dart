import 'package:cobrador_v2/db/cashflow_dao.dart';
import '../classes/cashflow.dart';

Future<void> save(Cashflow cashflow) async {
  final cashflows = CashflowDao.instance;
  Map<String, dynamic> row = {
    CashflowDao.columnPersonName: cashflow.personName,
    CashflowDao.columnValue: cashflow.value,
    CashflowDao.columnType: cashflow.type,
    CashflowDao.columnDate: DateTime.now().toString(),
    CashflowDao.columnPaid: 0,
    CashflowDao.columnNote: cashflow.note
  };
  await cashflows.insert(row);
}

void update(Cashflow cashflow) async {
  final cashflows = CashflowDao.instance;
  Map<String, dynamic> row = {
    CashflowDao.columnId: cashflow.id,
    CashflowDao.columnPersonName: cashflow.personName,
    CashflowDao.columnValue: cashflow.value,
    CashflowDao.columnType: cashflow.type,
    CashflowDao.columnNote: cashflow.note
  };
  await cashflows.update(row);
}

void payCashflow(Cashflow cashflow) async {
  final cashflows = CashflowDao.instance;
  Map<String, dynamic> row = {
    CashflowDao.columnId: cashflow.id,    
    CashflowDao.columnPaid: 1,
    CashflowDao.columnPaidDate: DateTime.now().toString(),
  };
  await cashflows.update(row);
}

void deleteCashflow(int id) async {
  final cashflows = CashflowDao.instance;  
  await cashflows.delete(id);  
}

