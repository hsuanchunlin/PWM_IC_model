# Application of Position weight matrix plus interaction couple (PWM+IC) to predict RNA/DNA - protein interaction using high-throughput result

## Introduction
Position weight matrix (PWM) has been widely applied to describe nucleotide importance of RNA/DNA - protein interaction. The basic assumption of PWM is that each necleotide does not interact and follows the iid rule in statistics. Which means PWM has limited ability to detected the mutual effects of nucleotides. For example, RNA/DNA have secondary structures and sometimes specific nucleotide pairs in neighbor or separate positions may enhance or decrease the interaction. Therefore we put interaction couple (IC) and trying to describe this phenomenoum, and this is PWM+PC method.

Like PWM, we implement PWM+IC by a linear regression model in R. We add interaction terms into the PWM linear model and do the fitting. The coefficients of each term is extracted and used to describe the rules of RNA/DNA - protein interaction.

In this repository, ___ is the original PWM + IC model file. We mamunaly add the interaction terms into the linear model. But once we have different protein to analyse, it loses the convenience. Therefore the _____ file solves this issue.

## How to use
### Generate a character table


### Check the format of the character table

### Run the R code

### Visualize your result to explore the interaction rules


## Referece and citation
If this work is useful to you, it would be great if you can cite my article.
