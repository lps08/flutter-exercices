const String baseUrl = 'pro-api.coinmarketcap.com';
const String quotePath = '/v2/cryptocurrency/quotes/latest';
const String listPath = '/v1/cryptocurrency/listings/latest';
const String apiKey = 'c8b941c9-81d7-4ead-8a98-7dd7c05d013f';
const String moneyType = 'BRL';
const Map<String, String> headers = {
  'Accepts': 'application/json',
  'X-CMC_PRO_API_KEY': apiKey,
};
