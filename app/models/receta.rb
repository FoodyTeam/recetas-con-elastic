	require 'elasticsearch/model'

class Receta < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['titulo^10', 'ingredientes']
        }
      }
    }
  )
end


end


Receta.import # for auto sync model with elastic search

# Delete the previous articles index in Elasticsearch
Receta.__elasticsearch__.client.indices.delete index: Receta.index_name rescue nil
 
# Create the new index with the new mapping
Receta.__elasticsearch__.client.indices.create \
  index: Receta.index_name,
  body: { settings: Receta.settings.to_hash, mappings: Receta.mappings.to_hash }
 
# Index all article records from the DB to Elasticsearch
Receta.import