class NoiseGenerator
  generate: (width, height) ->
    grid = []
    
    [0..height].map ->
      row = [0..width].map ->
        if Math.random() > 0.5
          1
        else
          0
      grid.push(row)
    
    grid

if exports?
  exports.NoiseGenerator = NoiseGenerator
