#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

ru = WikiData::Category.new('Категория:Депутаты Жогорку Кенеша', 'ru').wikidata_ids
en = WikiData::Category.new('Category:Members of the Supreme Council (Kyrgyzstan)', 'en').wikidata_ids

(ru + en).flatten.uniq.each do |id|
  data = WikiData::Fetcher.new(id: id).data('ky', 'ru') or next
  puts data
  ScraperWiki.save_sqlite([:id], data)
end
