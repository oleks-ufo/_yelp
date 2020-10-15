from sqlalchemy.orm import sessionmaker
from .models import Business, Category, Property, Schedule, db_connect, create_table


class YelpPipeline(object):
    def __init__(self):
        engine = db_connect()
        create_table(engine)
        self.Session = sessionmaker(bind=engine)

    def process_item(self, item, spider):
        session = self.Session()
        business = Business()

        if item.get('_properties') is not None:
            for prop in item['_properties']:
                current_prop = Property(property_content=prop)
                prop_exist = session.query(Property).filter_by(property_content=current_prop.property_content).first()
                if prop_exist is not None:
                    current_prop = prop_exist
                business.propertys_link.append(current_prop)

        if item.get('categories') is not None:
            for cat in item['categories']:
                current_cat = Category(category_content=cat)
                cat_exist = session.query(Category).filter_by(category_content=current_cat.category_content).first()
                if cat_exist is not None:
                    current_cat = cat_exist
                business.categorys_link.append(current_cat)

        schedule = Schedule(
            mon=item['schedule_d']['mon'],
            tue=item['schedule_d']['tue'],
            wed=item['schedule_d']['wed'],
            thu=item['schedule_d']['thu'],
            fri=item['schedule_d']['fri'],
            sat=item['schedule_d']['sat'],
            sun=item['schedule_d']['sun']
        )

        business.schedule_link.append(schedule)
        business.name = item['name']
        business.url = item['url']
        business._id = item['biz_id']
        business.image = item['image']
        business.phone = item['phone']
        business.email = None
        business.street = item['geo_street']
        business.city = item['geo_city']
        business.state = item['geo_state']
        business.country = item['geo_country']
        business.post_code = item['geo_post_code']
        business.rating = item['rating']
        business.reviews_count = item['reviews_count']
        business.link = item['link']
        business.about = item.get('about')

        try:
            session.add(business)
            session.commit()
        except:
            session.rollback()
            raise

        finally:
            session.close()

        return item
