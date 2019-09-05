<h1 align="center"> Visualisation of Multiple Correspondence Analysis (MCA) results from FactoMineR using Plotly</h1>

<h3>Summary</h3>

This is a script for automatic visualisation of MCA results from FactoMineR in 3 dimensions using Plotly (exported as html). It contains a function called `plotfun()` that transforms the results of FactoMineR's MCA function `FactoMineR::MCA()` to a structure that can be used by Plotly, and then creates and exports in html format six 3d scatterplots, namely: 

- Contributions of Categories
- Contributions of Individuals
- Coordinates of Categories
- Coordinates of Individuals
- Cosine Squared of Categories
- Cosine Squared of Individuals

<h3>Usage</h3>

The function, in order to work, must be supplied with two arguments:
1) A list that contains the results of an MCA function of FactoMineR
2) One of three valid plotting methods of Plotly's 3d scatterplot ("lines", "markers" or "linesmarkers").

ex. `plotfun(results.MCA, "lines")`

<h3>Results</h3>

The 3d scatterplots' axes are:

- x-dimension: The dimension
- y-dimension: Name of Category or Individual
- z-dimension: The value of each dimension for either Contributions, Coordinates or Cosine Squared

