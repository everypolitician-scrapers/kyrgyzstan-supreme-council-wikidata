#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

ru = WikiData::Category.new('Категория:Депутаты Жогорку Кенеша', 'ru').member_titles
en = WikiData::Category.new('Category:Members of the Supreme Council (Kyrgyzstan)', 'en').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: en, ru: ru})
