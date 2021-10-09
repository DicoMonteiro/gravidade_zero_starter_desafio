# Gerador de massa de dados

def factory_pix_positivo():
    
    return {
        "bank": "Next",
	    "chave": "Adriano Almeida",
	    "valor_pix": "100",
        "valor_saldo": "R$ 900",
        "valor_extrato": "R$ -100"
    }

def factory_pix_zero():
    
    return {
        "bank": "Nubank",
	    "chave": "Adriano Almeida",
	    "valor_pix": "0"
    }


def factory_pix_negativo():
    
    return {
        "bank": "Neon",
	    "chave": "Adriano Almeida",
	    "valor_pix": "-1"
    }


def factory_pix_sem_limite():
    
    return {
        "bank": "Neon",
	    "chave": "329712371902387983709837192873921739128731290873129083712987312987312987312098371209837120983172908iuhiudhdiuahdiasuhdasiuhdasiuhdasiuhiuh8372198127dbsadbsaoibdiudbasiu21897931287dasbiudaidasudasi97812983721jdasidashuidauhdas71237321dhashdash",
	    "valor_pix": "10",
        "valor_saldo": "R$ 990",
        "valor_extrato": "R$ -10"
    }
