import json
import scrapy
from scrapy.loader import ItemLoader
from yelp.items import YelpItem

# scrapy crawl yelp -a url=https://www.yelp.com/biz/fog-harbor-fish-house-san-francisco-2

class YelpSpider(scrapy.Spider):
    name = 'yelp'

    def __init__(self, *args, **kwargs):
        super(YelpSpider, self).__init__(*args, **kwargs)
        self.start_urls = [kwargs.get('url')]

    # start_urls = ['https://www.yelp.com/biz/fog-harbor-fish-house-san-francisco-2']

    @staticmethod
    def get_about_text(specialties, history, year):
        return f"From the business\nSpecialties\n{specialties}.\nHistory\nEstablished in {year}.\n{history}."

    @staticmethod
    def get_schedule(sel):
        result = {}
        if sel:
            for item in sel:
                day = item.css('th p::text').get().lower()
                hours = item.css('td ul li p::text').get()
                result[day] = hours
        return result

    def start_requests(self):
        for url in self.start_urls:
            yield scrapy.Request(url, self.parse)

    def parse(self, response):
        loader = ItemLoader(item=YelpItem(), response=response)

        data = response.css("script[type='application/ld+json']::text").get()
        data = json.loads(data)
        app_data = response.xpath("//script[contains(@data-hypernova-key, 'BizDetailsApp')]/text()").get()
        app_data = json.loads(app_data.strip('--><!--'))

        _properties = response.css("script[data-apollo-state]::text").get()
        categories = app_data['adSyndicationConfig'].get('categoryAliases')
        from_the_biz = app_data['bizDetailsPageProps'].get('fromTheBusinessProps')
        rating = data.get('aggregateRating')
        address = data.get('address')
        schedule_sel = response.css("tbody.lemon--tbody__373c0__2T6Pl tr")
        schedule_d = self.get_schedule(schedule_sel)

        about = ''
        if from_the_biz is not None:
            specialties = from_the_biz['fromTheBusinessContentProps']['specialtiesText']
            history = from_the_biz['fromTheBusinessContentProps']['historyText']
            year_established = from_the_biz['fromTheBusinessContentProps']['yearEstablished']
            about = self.get_about_text(specialties, history, year_established)

        if address is not None:
            loader.add_value('geo_street', address.get('streetAddress'))
            loader.add_value('geo_city', address.get('addressLocality'))
            loader.add_value('geo_state', address.get('addressRegion'))
            loader.add_value('geo_country', address.get('addressCountry'))
            loader.add_value('geo_post_code', address.get('postalCode'))

        loader.add_value('name', data.get('name'))
        loader.add_value('url', response.request.url)
        loader.add_xpath('biz_id', "//a[contains(@href, 'biz_id=')]/@href")
        loader.add_value('image', data.get('image'))
        loader.add_value('phone', data.get('telephone'))
        loader.add_value('rating', float(rating.get('ratingValue')) if rating else None)
        loader.add_value('reviews_count', rating.get('reviewCount') if rating else None)
        loader.add_value('categories', categories)
        loader.add_xpath('link', "//a[contains(@href, '/biz_redir?')]/@href")
        loader.add_value('schedule_d', schedule_d)
        loader.add_value('about', about)
        loader.add_value('_properties', _properties)

        yield loader.load_item()
