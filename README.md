### Mission

We have some customer records in a text file (customers.txt) -- one
customer per line, JSON lines formatted. We want to invite any customer
within 100km of our Dublin office for some food and drinks on us. Write
a program that will read the full list of customers and output the names
and user ids of matching customers (within 100km), sorted by User ID
(ascending).

You can use the first formula from this
[Wikipedia](https://en.wikipedia.org/wiki/Great-circle_distance) article
to calculate distance. Don't forget, you'll need to convert degrees to
radians.
The GPS coordinates for our Dublin office are 53.339428, -6.257664.
You can find the Customer list here.
We're looking for you to produce working code, with enough room to
demonstrate how to structure components in a small program.

### Configure Env

```shell
gem install bundle && bundle
```

### Test
```shell
rspec
```

### Run
```shell
./bin/customer_records
```

### Result
```shell
4 - Ian Kehoe
5 - Nora Dempsey
6 - Theresa Enright
8 - Eoin Ahearn
11 - Richard Finnegan
12 - Christina McArdle
13 - Olive Ahearn
15 - Michael Ahearn
17 - Patricia Cahill
23 - Eoin Gallagher
24 - Rose Enright
26 - Stephen McArdle
29 - Oliver Ahearn
30 - Nick Enright
31 - Alan Behan
39 - Lisa Ahearn
```
