#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

ru = WikiData::Category.new('Категория:Депутаты Жогорку Кенеша', 'ru').wikidata_ids
en = WikiData::Category.new('Category:Members of the Supreme Council (Kyrgyzstan)', 'en').wikidata_ids

query = <<SPARQL
  SELECT DISTINCT ?item WHERE {
    ?item p:P39 [ ps:P39 wd:Q21091853 ; pq:P2937 ?term ] .
    ?term p:P31/pq:P1545 ?ordinal .
    FILTER (xsd:integer(?ordinal) >= 5)
  }
SPARQL
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: en | ru | p39s)
