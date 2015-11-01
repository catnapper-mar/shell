#!/bin/bash
get_myname() {
  echo `basename $1 | sed 's/\.sh$//'`
}

timestamp() {
  date +'%Y-%m-%d %H:%M:%S'
}

get_fmt_date() {
  fmt=$1
  num=$2
  if [ "${num}" != "" ]; then
    if [ ${num} -le 0 ]; then
      num=`expr ${num} \* -1`
      par="${num} day ago"
    else
      par="${num} day"
    fi
    #echo "date -d ${par} +${fmt}"
    echo `date -d "${par}" +${fmt}`
  else
    #echo "date +${fmt}"
    echo `date +${fmt}`
  fi
}

get_fmt_datehour() {
  fmt=$1
  num=$2
  if [ "${num}" != "" ]; then
    if [ ${num} -le 0 ]; then
      num=`expr ${num} \* -1`
      par="${num} hour ago"
    else
      par="${num} hour"
    fi
    #echo "date -d ${par} +${fmt}"
    echo `date -d "${par}" +${fmt}`
  else
    #echo "date +${fmt}"
    echo `date +${fmt}`
  fi
}

get_ymd() {
  echo "$(get_fmt_date '%Y%m%d' $1)"
}

get_ymd_separated() {
  echo "$(get_fmt_date '%Y-%m-%d' $1)"
}

get_ymdh() {
  echo "$(get_fmt_datehour '%Y%m%d%H' $1)"
}

get_ymdh_separated() {
  echo "$(get_fmt_datehour '%Y-%m-%d-%H' $1)"
}

LOG_LEVEL_DEFAULT=3

write_log() {
  echo "$(timestamp) [$1] " "$2"
}

log_error() {
  if [ ${LOG_LEVEL:-${LOG_LEVEL_DEFAULT}} -ge 1 ]; then
    echo $(write_log ERROR "$1")
  fi
}

log_warn() {
  if [ ${LOG_LEVEL:-${LOG_LEVEL_DEFAULT}} -ge 2 ]; then
    echo $(write_log WARN "$1")
  fi
}

log_info() {
  if [ ${LOG_LEVEL:-${LOG_LEVEL_DEFAULT}} -ge 3 ]; then
    echo $(write_log INFO "$1")
  fi
}

log_debug() {
  if [ ${LOG_LEVEL:-${LOG_LEVEL_DEFAULT}} -ge 4 ]; then
    echo $(write_log DEBUG "$1")
  fi
}

