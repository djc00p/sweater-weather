User.destroy_all
FavoriteCity.destroy_all

user_1 = User.create(email: 'user_1@email.com', password: 'password', api_key: 'afac8984765b1c174599e5ea139b41ecf671a402e18872b963549ecce5311633')
user_2 = User.create(email: 'user_2@email.com', password: 'password', api_key: '0fc80672727477e92ac67b8e6e8a154f147988eb776aa09c57c34abfca542f63')
user_3 = User.create(email: 'user_3@email.com', password: 'password', api_key: '5954a261db64747a0ae626d91376472452baed227f91b43a19250d392a2c2b8a')

fav_city = FavoriteCity.create(location: 'Denver, CO', user_id: user_1.id)
fav_city = FavoriteCity.create(location: 'Seattle, WA', user_id: user_1.id)
fav_city = FavoriteCity.create(location: 'San Diego, CA', user_id: user_1.id)
