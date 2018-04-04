#!/bin/bash

cat /mnt/data/public/muzika/muzika.m3u | perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);' | head -1
