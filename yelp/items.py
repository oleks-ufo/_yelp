import re
import json
from urllib.parse import unquote
from w3lib.html import remove_tags

from scrapy import Item, Field
from itemloaders.processors import MapCompose, TakeFirst


def get_content(raw):
    if raw is not None:
        if isinstance(raw, list):
            return [remove_tags(i).strip() for i in raw]
        return remove_tags(raw)
    return ''


def parse_id(_id):
    if _id is not None:
        return _id.split('biz_id=')[-1]
    return ''


def parse_link(link):
    link = unquote(link)
    return link.split('&')[0].strip('/biz_redir?url=')


def parse_prop(prop):
    result = []
    start = '"__typename":"OrganizedBusinessPropertiesSection"}'
    end = '"__typename":"BusinessProperty"}'
    prop = prop.replace('&quot;', '"').replace('\&quot;', '"')
    prop = prop.split(start)
    if len(prop) == 2:
        prop = prop[1]
        prop = prop.rsplit(end, 1)[0]
        prop += end
        split_ptrn = re.compile('\.\d+\.properties\.\d+":')
        splited = re.split(split_ptrn, prop)
        del splited[0]
        for s in splited:
            s = f"{s.split('}')[0]}}}"
            s = json.loads(s)
            curr_prop = s.get('displayText')
            if curr_prop is not None:
                result.append(s.get('displayText'))
    return result


class YelpItem(Item):
    name = Field(output_processor=TakeFirst())
    url = Field(output_processor=TakeFirst())
    biz_id = Field(
        input_processor=MapCompose(parse_id),
        output_processor=TakeFirst()
    )
    image = Field(output_processor=TakeFirst())
    phone = Field(output_processor=TakeFirst())
    geo_street = Field(output_processor=TakeFirst())
    geo_city = Field(output_processor=TakeFirst())
    geo_state = Field(output_processor=TakeFirst())
    geo_country = Field(output_processor=TakeFirst())
    geo_post_code = Field(output_processor=TakeFirst())
    rating = Field(output_processor=TakeFirst())
    reviews_count = Field(output_processor=TakeFirst())
    categories = Field()
    link = Field(
        input_processor=MapCompose(parse_link),
        output_processor=TakeFirst(),
    )
    schedule_d = Field(output_processor=TakeFirst())
    about = Field(output_processor=TakeFirst())
    _properties = Field(
        input_processor=MapCompose(parse_prop),
    )
