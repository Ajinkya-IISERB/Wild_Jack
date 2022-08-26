library(reshape2)
library(ggplot2)

df <- structure(list(PAML_BS = 1184, aBSREL=848, RELAX_Intensified=668, Common=473, PAML = 1504, RELAX=410, Common=210), .Names = c("PAML_BS","aBSREL","RELAX_Intensified","Common_PS","PAML","RELAX","Common_RS"), class = "data.frame", row.names = c(NA, -1L))

melt(df)->B

B$id <- c(rep("Positive selection",4),rep("Relaxed selection",3))

ggplot(B, aes(variable, value, fill=id)) + geom_bar(stat = "identity") + labs(x="",y="Number of genes",title="Positive and Relaxed Selection analysis",fill="Type of Selection Analysis") + theme(legend.position="top")

pdf("selection_summary.pdf")
ggplot(B, aes(variable, value, fill=id)) + geom_bar(stat = "identity") + labs(x="",y="Number of genes",title="Positive and Relaxed Selection analysis",fill="Type of Selection Analysis") + theme(legend.position="top")
dev.off()
plt <- ggplot(B, aes(variable, value, fill=id)) + geom_bar(stat = "identity") + labs(x="",y="Number of genes",title="Positive and Relaxed Selection analysis",fill="Type of Selection Analysis") + theme(legend.position="top")

ggsave("selection_summary.jpeg", plot = plt, dpi = 500,limitsize = FALSE)

