require 'redis'

$redis = Redis::Namespace.new(ENV['REDIS_NAMESPACE'], :redis => Redis.new)