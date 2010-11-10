#!/usr/bin/env bash

/usr/lib/hadoop/bin/hadoop 	\
  jar /usr/lib/hadoop/contrib/streaming/hadoop-*streaming*.jar 	\
  -D mapred.reduce.tasks=0 	\
  -D mapred.job.name='Motherfucking Indexing' \
  -mapper  '/usr/bin/jruby -J-Xmx1500m /home/jacob/Programming/wonderdog/bin/wukong_indexer.rb --map --buffered_docs=50000' 	\
  -reducer '' 	\
  -input   '/tmp/tweet/part-00000' \
  -input   '/tmp/tweet/part-00001' \
  -input   '/tmp/tweet/part-00002' \
  -input   '/tmp/tweet/part-00003' \
  -input   '/tmp/tweet/part-00004' \
  -output  '/tmp/has_been_indexed' \
  -cmdenv 'RUBYLIB=/home/jacob/Programming/wukong/lib:/home/jacob/Programming/wuclan/lib:/home/jacob/Programming/monkeyshines/lib:/home/jacob/.rubylib'