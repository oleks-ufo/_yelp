from sqlalchemy import create_engine, Column, Table, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import (Integer, String, Float, Text)
from scrapy.utils.project import get_project_settings


Base = declarative_base()


def db_connect():
    """
    Performs database connection using database settings from settings.py.
    Returns sqlalchemy engine instance
    """
    return create_engine(get_project_settings().get("CONNECTION_STRING"))


def create_table(engine):
    Base.metadata.create_all(engine)


business_category = Table(
    'business_category',
    Base.metadata,
    Column('business_id', Integer, ForeignKey('business.id')),
    Column('category_id', Integer, ForeignKey('category.id'))
)

business_property = Table(
    'business_property',
    Base.metadata,
    Column('business_id', Integer, ForeignKey('business.id')),
    Column('_property', Integer, ForeignKey('_property.id'))
)


class Business(Base):
    __tablename__ = 'business'

    id = Column(Integer, primary_key=True)
    name = Column('name', String(200), unique=True)
    url = Column('url', String(200), unique=True)
    _id = Column('_id', String(50), unique=True)
    image = Column('image', String(200), unique=True)
    phone = Column('phone', String(20))
    email = Column('email', String(50))
    city = Column('city', String(50))
    country = Column('country', String(50))
    post_code = Column('post_code', String(50))
    state = Column('state', String(50))
    street = Column('street', String(50))
    rating = Column('rating', Float())
    reviews_count = Column('reviews_count', Integer())
    link = Column('link', String(200), unique=True)
    about = Column('about', Text())
    categorys_link = relationship('Category', secondary='business_category', lazy='dynamic', backref='business') # M-to-M
    propertys_link = relationship('Property', secondary='business_property', lazy='dynamic', backref='business') # M-to-M
    schedule_link = relationship('Schedule', back_populates='businesses_link') # One-to-M


class Category(Base):
    __tablename__ = 'category'

    id = Column(Integer, primary_key=True)
    category_content = Column('category_content', String(50))
    businesses_link = relationship('Business', secondary='business_category', lazy='dynamic', backref='category')


class Property(Base):
    __tablename__ = '_property'

    id = Column(Integer, primary_key=True)
    property_content = Column('property_content', Text())
    businesses_link = relationship('Business', secondary='business_property', lazy='dynamic', backref='_property')


class Schedule(Base):
    __tablename__ = 'schedule'

    id = Column(Integer, primary_key=True)
    mon = Column('mon', String(50))
    tue = Column('tue', String(50))
    wed = Column('wed', String(50))
    thu = Column('thu', String(50))
    fri = Column('fri', String(50))
    sat = Column('sat', String(50))
    sun = Column('sun', String(50))

    business_id = Column(Integer, ForeignKey('business.id'))
    businesses_link = relationship('Business', back_populates='schedule_link')
