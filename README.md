## ActsAsKv ##

ActsAsKv is a key-value simulate under relational db

Example

Suppose your model name is  KvDB

You can do:
### Usage ###
	KvDb.set(:key_a, { :a => 1})
	KvDb.get(:key_a) # { :a => 1}
	KvDb.drop(:key_a) # 


Copyright (c) 2010 [rociiu.yu@gmail.com, yanguango@gmail.com], released under the MIT license
