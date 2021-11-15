require (
  'gmail_sender'
)

def email(titulo,texto)
  system "cls||clear"
  system "cat banner.txt"
  print "\nDigite seu email >>> "
  email=gets.chomp
  print "Digite sua senha >>> "
  senha=gets.chomp
  print "Digite o número do alvo >>> "
  numero=gets.chomp
  quantidade=""
  while quantidade.class != Integer do
    system "cls||clear"
    system "cat banner.txt"
    print "\nDigite seu email >>> "+email+"\nDigite sua senha >>> "+senha+"\nDigite o número do alvo >>>"+numero+"Digite a quantidade de emails que irá enviar >>> "
    quantidade = gets.chomp.to_i
  end
  begin
    for _ in 1..quantidade do
      GmailSender.new(
        email,
        senha
      ).send(
        :to=>"support@support.whatsapp.com",
        :subject=>titulo,
        :content=>texto+numero
      )
    end
  rescue Exception
    puts "Permissão de Apps menos seguros não ativada ou Email/Senha inválido(s)."
  end
end

Sair=false
while Sair==false do
  system "cls||clear"
  system "cat banner.txt"
  print "Coded By: Kiny\nPix: (21) 97918-0533\n\n[ 1 ] Desativar número\n[ 2 ] Desbanir número\n\n[ 3 ] Sair\n>>> "
  option = gets.chomp
  case option
  when "1"
    email("Desative este número.","Solicito a desativação da minha conta do WhatsApp, meu número é ")
  when "2"
    email("Meu número foi banido injustamente.","Nossa! Eu estava trabalhando e de repente minha conta do WhatsApp foi banida, preciso que reativem ela, pois é minha conta de trabalho. Meu número: ")
  when "3"
    Sair=true
  end
end

system "cls||clear"
puts "Até logo."
