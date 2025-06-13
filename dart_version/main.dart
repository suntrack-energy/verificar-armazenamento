import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('historico.json');
  final jsonContent = await file.readAsString();
  final data = jsonDecode(jsonContent);

  List<dynamic> historico = data['historico_semanal'];
  double armazenamentoHoje = 0.23;
  historico.add(armazenamentoHoje);

  double media = historico.fold<double>(0, (sum, e) => sum + e) / historico.length * 100;

  if (media < 65) {
    exibirNotificacao(media);
  } else {
    print('\nArmazenamento de energia: OK');
  }

  await file.writeAsString(jsonEncode({'historico_semanal': historico}));
}

void exibirNotificacao(double media) {
  print('\nMédia de armazenamento semanal baixa!');
  print('Cliente, notamos que a sua média de armazenamento semanal está baixa: ${media.toStringAsFixed(0)}%.');
  print('Que tal programar uma Tarefa Smart para armazenar mais energia?!');
}
