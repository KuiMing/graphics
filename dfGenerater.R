set.seed(3690)

# 設定起始點為 (0, 0) 的行向量。(以矩陣表示)
p = matrix(c(0, 0), ncol = 1)
# 建立名為 coord 的 data.frame。
df = rbind(data.frame(), t(p))
for (i in 1:10000) {
  # 從 uniform(0, 1) 中抽取 indicator 決定當次遞迴式。
  indicator = runif(1, 0, 1)
  # 根據抽樣結果決定遞迴式。
  if (indicator <= 0.05) {
    m = matrix(c(0, 0, 0, 0.16), nrow = 2, ncol = 2)
    const = matrix(c(0, 0), ncol = 1)
    } 
  else if (indicator <= 0.86) {
    m = matrix(c(0.85, -0.04, 0.04, 0.85), nrow = 2, ncol = 2)
    const = matrix(c(0, 1.6), ncol = 1)
    } 
  else if (indicator <= 0.93) {
    m = matrix(c(0.2, 0.23, -0.26, 0.22), nrow = 2, ncol = 2)
    const = matrix(c(0, 1.6), ncol = 1)
    } 
  else {
    m = matrix(c(-0.15, 0.26, 0.28, 0.24), nrow = 2, ncol = 2)
    const = matrix(c(0, 0.44), ncol = 1)
    }
  # 計算新的 p 坐標值。
  p = m %*% p + const
  # 將新的 p 點坐標合併至 coord 中。
  df = rbind(df, t(p))
}