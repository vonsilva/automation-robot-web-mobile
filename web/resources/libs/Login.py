from faker import Faker

fake = Faker('pt-BR')


def get_fake_login():
    account = {
        "name": fake.name(),
        "email": fake.email(),
        "cpf": fake.cpf()
    }

    return account