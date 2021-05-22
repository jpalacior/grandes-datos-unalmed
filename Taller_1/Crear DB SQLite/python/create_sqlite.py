# -*- coding: utf-8 -*-
"""
Created on Sat Apr 24 16:27:40 2021

@author: Julian
"""

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, Column, Integer, String


engine = create_engine("sqlite:///olist.db")

base = declarative_base()

class tabla(base):
    __tablename__ = 'tbl_prueba'
    
    id = Column(Integer, primary_key=True)
    name = Column(String)
    fullname = Column(String)


base.metadata.create_all(engine)
