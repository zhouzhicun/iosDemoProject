使用button注意事项：
1）如果只有title或者只有image，则直接使用XNLCommonButton即可。

2) 如果同时有title和image, 但是不设置button的size的话，即默认为button的最小size.
则使用XNLVerticalButton(垂直) 和 XNLHorizontalButton(水平). 并设置space和alignType即可。

3）如果同时有title和image, 并且设置button的size，则使用：
XNLFixSizeHorizontalButton 和 XNLFixSizeVerticalButton,
并根据需要设置contentLayoutType 和 space, titlePadding 和 imagePadding.

