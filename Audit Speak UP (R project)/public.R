#technical
#install.packages("tidyverse")
#install.packages("patchwork")
library(tidyverse)
library(patchwork)


#files from google trends
best_online_public_speaking_course <-  "data (.csv)/time_series_Worldwide_20211007-2014_20261007-2014.csv"
speak_with_confidence_course <- "data (.csv)/tiшme_series_Worldwide_20211007-2014_20261007-2014.csv"
communication_skills_training_online <- "data (.csv)/time_series_Worldwide_20211007-2015_20261007-2015.csv"


#best_online_public_speaking_course analyze
bopsc <- read.csv(best_online_public_speaking_course)
bopsc$Time <- as.Date(bopsc$Time)
colnames(bopsc) <-  c("Time", "Quantity")
print(bopsc)

p_bopsc <- ggplot(bopsc, aes(x = Time, y = Quantity)) + geom_line(linewidth = 2, aes(colour = "red")) + geom_point() + scale_x_date(date_breaks = "12 months", date_labels = "%b %Y") + labs(title = "best online public speaking course", x = "Time", y = "Search interest")
print(p_bopsc)
ggsave(filename = "R plots (google trends)/bopsc.png", plot = p_bopsc, width = 10, height = 6, dpi = 300)

#speak_with_confidence_course analyze
swcc <- read.csv(speak_with_confidence_course)
swcc$Time <- as.Date(swcc$Time)
colnames(swcc) <- c("Time", 'Quantity')
print(swcc)

p_swcc <- ggplot(swcc, aes(x = Time, y = Quantity)) + geom_line(linewidth = 2, colour = "green") + geom_point() + scale_x_date(date_breaks = "12 months", date_labels = "%b %Y") + labs(title = "Speak with confidence course", x = 'Time', y = "Search interest")
print(p_swcc)
ggsave(filename = "R plots (google trends)/swcc.png", plot = p_swcc, width = 10, height = 6, dpi = 300)


#communication_skills_training_online analyze
csto <- read.csv(communication_skills_training_online)
csto$Time <- as.Date(csto$Time)
colnames(csto) <- c("Time", 'Quantity')
print(csto)

p_csto <- ggplot(csto, aes(x = Time, y = Quantity)) + geom_line(linewidth = 2, colour = "brown") + geom_point() + scale_x_date(date_breaks = "12 months", date_labels = "%b %Y") + labs(title = "Communication skills training online", x = 'Time', y = "Search interest")
print(p_csto)
ggsave(filename = "R plots (google trends)/csto.png", plot = p_csto, width = 10, height = 6, dpi = 300)


#overall All
combined_3_all <- p_bopsc + p_swcc + p_csto + plot_layout(ncol = 1)
print(combined_3_all)
ggsave("R plots (google trends)/all_three.png", combined_3_all, width = 10, height = 12, dpi = 300)


#overall All in One
overall <- bind_rows("best online public speaking course" = bopsc, "speak with confidence course" = swcc, "communication skills training online" = csto, .id = "keyword")

p_overall <- ggplot(overall, aes(x = Time, y = Quantity, colour = keyword)) + geom_line(linewidth = 2) + geom_point(size = 1.5) + scale_x_date(date_breaks = "6 months", date_labels = "%b %Y") + labs(title = "Search interest comparison", x = "Time", y = "Search interest", colour = "Keyword")
print(p_overall)
ggsave("R plots (google trends)/Overall.png", p_overall, width = 10, height = 12, dpi = 300)
