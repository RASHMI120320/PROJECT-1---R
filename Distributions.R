
#Using graphs to check for statistically significant differences

#pre-program distribution of genders across both the groups
plot_diff_sex <- ggplot(village_randomized, aes(x = program, y = sex_num, color = program)) +
  stat_summary(geom = "pointrange", fun.data = "mean_se", fun.args = list(mult = 1.96)) +
  guides(color = FALSE) +
  labs(x = NULL, y = "Proportion male")

plot_prop_sex <- ggplot(village_randomized, aes(x = program, fill = sex)) +
  geom_bar(position = "fill") +
  labs(x = NULL, y = "Proportion", fill = NULL) +
  scale_fill_manual(values = c("darkblue", "darkred"))

plot_diff_sex + plot_prop_sex

#pre-program distribution of age across both the groups
plot_diff_age <- ggplot(village_randomized, aes(x = program, y = age, color = program)) +
  stat_summary(geom = "pointrange", fun.data = "mean_se", fun.args = list(mult = 1.96)) +
  guides(color = FALSE) +
  labs(x = NULL, y = "Age")

plot_hist_age <- ggplot(village_randomized, aes(x = age, fill = program)) +
  geom_histogram(binwidth = 1, color = "white") +
  guides(fill = FALSE) +
  labs(x = "Age", y = "Count") +
  facet_wrap(vars(program), ncol = 1)

plot_diff_age + plot_hist_age

#pre-program distribution of incomes across both the groups
plot_diff_income <- ggplot(village_randomized, aes(x = program, y = pre_income, color = program)) +
  stat_summary(geom = "pointrange", fun.data = "mean_se", fun.args = list(mult = 1.96)) +
  guides(color = FALSE) +
  labs(x = NULL, y = "Pre income")

plot_hist_income <- ggplot(village_randomized, aes(x = pre_income, fill = program)) +
  geom_histogram(binwidth = 20, color = "white") +
  guides(fill = FALSE) +
  labs(x = "Pre income", y = "Count") +
  facet_wrap(vars(program), ncol = 1)

plot_diff_income + plot_hist_income