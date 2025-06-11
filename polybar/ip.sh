#!/bin/bash

My_ip=$(curl ident.me)

notify-send "$My_ip"

