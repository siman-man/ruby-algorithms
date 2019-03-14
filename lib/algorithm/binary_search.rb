def binary_search(ok:, ng:)
  while (ok - ng).abs > 1
    mid = (ok + ng) / 2

    if yield(mid)
      ok = mid
    else
      ng = mid
    end
  end

  ok
end
