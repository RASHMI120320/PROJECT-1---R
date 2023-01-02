# Estimating Difference

#Causal Effect of the program is given the average treatment effect
village_randomized %>% 
  group_by(program) %>% 
  summarize(avg_post = mean(post_income))

model_rct <- lm(post_income ~ program, data = village_randomized)
tidy(model_rct)


ggplot(village_randomized, aes(x = program, y = post_income, color = program)) +
  stat_summary(geom = "pointrange", fun.data = "mean_se", fun.args = list(mult = 1.96)) +
  guides(color = FALSE) +
  labs(x = NULL, y = "Post income")

