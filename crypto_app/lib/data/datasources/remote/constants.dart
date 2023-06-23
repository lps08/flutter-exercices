const String baseUrl = 'pro-api.coinmarketcap.com';
const String quotePath = '/v2/cryptocurrency/quotes/latest';
const String listPath = '/v1/cryptocurrency/listings/latest';
const String apiKey = '29a04f6f-5ec4-49c5-8262-95ee845a0dc5';
const String moneyType = 'BRL';
const Map<String, String> headers = {
  'Accepts': 'application/json',
  'X-CMC_PRO_API_KEY': apiKey,
};
