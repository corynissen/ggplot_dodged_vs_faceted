
require(ggplot2)
df <- read.csv("bowling.csv", strip.white=T)

a <- 1:200

# faceted
ggplot(df, aes(x=factor(game), y=score)) +
  geom_bar(stat="identity",aes(fill=factor(game))) + facet_grid(.~name) +
  coord_cartesian(ylim=c(50, 150)) + scale_y_continuous(breaks=a[a%%10==0]) +
  scale_fill_discrete(name="Game") + xlab("") + ylab("Score")
ggsave("faceted_bowling.jpg")

# dodged
ggplot(df, aes(x=factor(name), y=score)) +
  geom_bar(position="dodge", stat="identity",aes(fill=factor(game))) +
  coord_cartesian(ylim=c(50, 150)) + scale_y_continuous(breaks=a[a%%10==0]) +
  xlab("") + ylab("Score") + scale_fill_discrete(name="Game") +
  geom_hline(y=100, color="red", size=1) +
  opts(axis.text.x = theme_text(size=14))
ggsave("dodged_bowling.jpg")
