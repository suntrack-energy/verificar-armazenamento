def exibir_notificacao():
    print(f'\nMédia de armazenamento semanal baixa!'
          f'\nCliente, notamos que a sua média de armazenamento semanal está baixa: {media_semanal:.0f}%.'
          f'\nQue tal programar uma Tarefa Smart para aramzenar mais energia?!')

historico_semanal = [0.25, 0.35, 0.77, 0.47, 0.63, 0.67]

armazenamento_hoje = 0.23
historico_semanal.append(armazenamento_hoje)

media_semanal = sum(historico_semanal) / len(historico_semanal) * 100

if media_semanal < 65:
    exibir_notificacao()
else:
    print('\nArmazenamento de energia: OK')
