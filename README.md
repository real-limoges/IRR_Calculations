Quick couple functions to calculate the Internal Rate of Return for
irregular payment streams.

Known issue: IRR may be incorrect since there may be multiple solutions. This is an open research question in Economics - one thing to keep in mind using this.

Potential solution : looking at the life cycle of the fund, and determining a value for initial_IRR to change - early in the life cycle of the fund, the IRR should be strongly negative (close to -1) and later in the fund it should be closer to 0.2.

Currently, I am just correcting this by removing the mode (where incorrect solutions are clustering.) There should be no funds with the same IRR unless they have the same payment streams (in time gaps and magnitude.)