library(tidyverse)

tibble(
  algo = c("Logistic Regression", "Deep Learning"),
  Accuracy = c(73.19, 73.68),
  `F1 Score` = c(72.99, 70.62)
) %>%
  pivot_longer(cols = -algo) %>%
  ggplot(aes(value, algo)) +
  geom_segment(
    aes(
      y = algo,
      yend = algo,
      x = 0,
      xend = 100
    ),
    lineend = "round",
    lwd = 3.7,
    col = "#080807"
  ) +
  geom_segment(aes(
    y = algo,
    yend = algo,
    x = 0,
    xend = value
  ),
  col = "white",
  lwd = 3.2) +
  facet_wrap(~ name) +
  labs(title = "Model Comparison",
       y = NULL,
       x = "Metric score") +
  geom_vline(xintercept = 75, col = "grey50") +
  scale_x_continuous(labels = scales::percent_format(scale = 1)) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    panel.background = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(face = "bold", size = 22),
    text = element_text(family = "Chakra Petch")
  ) +
  coord_flip()
