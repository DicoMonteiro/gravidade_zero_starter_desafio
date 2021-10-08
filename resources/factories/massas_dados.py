# Gerador de massa de dados

def factory_pix_positivo():
    
    return {
        "bank": "Next",
	    "chave": "Adriano Almeida",
	    "valor_pix": "100",
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
