# U of M Islandora Solr Indexing Config

This configuration no longer works with GSearch and is designed specifically for use with [fc3-camel-indexer](https://github.com/uml-digitalinitiatives/fc3-camel-indexer) in the master-parallel branch.

Each XSLT is the name of the datastream ID it is designed to index. If a datastream is found and there is not a similarly named XSLT, it is **not** indexed.

A **FOXML.xslt** is required to handle properties of the FoXML object.

## Maintainer

[Jared Whiklo](https://github.com/whikloj)

