def memoize(f):
  memo = {}
  def helper(x):
    if x not in memo:
      memo[x] = f(x)
    return memo[x]
  return helper

def fib(n):
  return n if n <= 1 else fib(n-1) + fib(n-2)


fib = memoize(fib)

