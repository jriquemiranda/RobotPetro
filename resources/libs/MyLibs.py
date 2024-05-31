import psycopg2

def consultar_passagem(ACESSO,CODIGO):
    
    conn = psycopg2.connect(
        host=ACESSO.HOST,
        database=ACESSO.DATABASE,
        user=ACESSO.USER,
        password=ACESSO.PASSWORD
    )

    query = f"SELECT * FROM bdo_servico bs WHERE codigo = '{CODIGO}';"

    cur = conn.cursor()
    cur.execute(query)
        
    resp = cur.fetchall()

    conn.commit()
    conn.close()
    
    return resp

def Cancelar_BDO_Servico(ACESSO,CODIGO):
    
    conn = psycopg2.connect(
        host=ACESSO.HOST,
        database=ACESSO.DATABASE,
        user=ACESSO.USER,
        password=ACESSO.PASSWORD
    )

    query = f"UPDATE bdo_servico bs SET status = 'CANCELADO', situacao = 'CANCELADO' WHERE codigo = '{CODIGO}';"

    cur = conn.cursor()
    cur.execute(query)

    conn.commit()
    conn.close()