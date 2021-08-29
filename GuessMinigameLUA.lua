function abertura_do_jogo()
    print("Bem-Vindo ao jogo de adivinhação!\
Jogo criado por Otávio Pavoni para aprender LUA.\
    \nA licença deste software é GPL3.0")
end

function manual()
    print("\nVocê deseja ler o manual do jogo? (s/n)?")
        local resposta = io.read()
        if resposta == "s" then
            print("\nEsse é um jogo de adivinhação. \nA máquina irá pensar em um número e você terá que acertar qual é esse número por meio da tentativa e erro. \n\nA máquina te diz se o número é maior ou menor.")
        end
end

function cria_numero_aleatorio()
	seed = os.clock()*100000000
	math.randomseed(seed)
	return math.random(1,100)
end

function captura_palpite()
  while true do
    print("\nDigite um número:")
          palpite = io.read()
          if type(tonumber(palpite)) == "number" then
            palpite = tonumber(palpite)
            if palpite > 100 or palpite < 1 then
              print("Seu palpite foi inválido, use um número entre 1 e 100.")
            else
              return palpite
              end
          else
          print("Por favor, digite um número.")
          end
    end
end

function compara_palpite(num_do_computador, palpite)
    if num_do_computador == palpite then
		return true
	else
		if num_do_computador > palpite then variacao = "menor" else variacao = "maior" end
		print("Não, este não é o número que eu estava pensando :(")
		print("O número que você disse é "..variacao.." que o que eu estava pensando")
		return false
    end
end

function imprime_interacao(numero, resultado_da_partida)
	if resultado_da_partida then
		print("PARABÉNS! Eu realmente estava pensando no número "..numero.."!")
	else
		print("Que tal tentar novamente?")
	end
	return not resultado_da_partida
end

function partida(numero_secreto)
	palpite = captura_palpite()
	return imprime_interacao(numero_secreto, compara_palpite(numero_secreto, palpite))
end

function loop_principal()
	numero_secreto = cria_numero_aleatorio()
	continua_jogando = true
	while continua_jogando do
	continua_jogando = partida(numero_secreto)
end
end

function jogo()
	repete_o_jogo = true
	repeat
		loop_principal()
		print("Deseja jogar novamente? (s/n)?")
		resposta = io.read()
		if resposta == "n" then
			repete_o_jogo = false
		end
	until not repete_o_jogo
end

abertura_do_jogo()
manual()
jogo()
