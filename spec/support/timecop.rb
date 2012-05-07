def in_the_future
  Timecop.travel(1.hour.from_now) do
    yield
  end
end
