# Use Noodall's default dragonfly setup for assets
require 'noodall/dragonfly'

# Set the slots that are avaiable to put components in
Noodall::Node.slots :main, :large, :small

# Set the mongo collection name for nodes
Noodall::Node.set_collection_name 'nodes'

# Reset global update time on startup
Noodall::GlobalUpdateTime::Stamp.update!
