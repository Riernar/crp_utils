{
  "type": "grammar",
  "topLevelInitializer": {
    "type": "top_level_initializer",
    "code": "\n\n    const KEEP_DROP_WHICH = {\"h\": \"high\", \"l\": \"low\"};\n    const SORT_ORDER = {\"a\": \"ascending\", \"d\": \"descending\"};\n\n    function makeBinaryOperator(head, tail, operatorIndex=0, rightIndex=1) {\n        return tail.reduce(\n            function (left, array) {\n                return {\n                    type: \"binary_operator\",\n                    operator: array[operatorIndex],\n                    left: left,\n                    right: array[rightIndex]\n                };\n            },\n            head\n        );\n    }\n\n    function makeFunctionCall(name, expression) {\n        return {\n            type: \"function_call\",\n            name: name,\n            argument: expression\n        };\n    }\n\n    function makeDiceModifier(name, compare_point=null) {\n        obj = {\n            type: \"modifier\",\n            name: name\n        };\n        if (compare_point) {\n            obj.compare_point = compare_point.operator;\n        }\n        return obj;\n    }\n",
    "codeLocation": {
      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
      "start": {
        "offset": 941,
        "line": 18,
        "column": 3
      },
      "end": {
        "offset": 1907,
        "line": 55,
        "column": 1
      }
    },
    "location": {
      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
      "start": {
        "offset": 939,
        "line": 18,
        "column": 1
      },
      "end": {
        "offset": 1910,
        "line": 56,
        "column": 1
      }
    }
  },
  "initializer": null,
  "definitions": [
    {
      "type": "rule",
      "name": "Start",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2264,
          "line": 66,
          "column": 1
        },
        "end": {
          "offset": 2269,
          "line": 66,
          "column": 6
        }
      },
      "expression": {
        "type": "rule_ref",
        "name": "Expression",
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 2276,
            "line": 67,
            "column": 5
          },
          "end": {
            "offset": 2286,
            "line": 67,
            "column": 15
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2264,
          "line": 66,
          "column": 1
        },
        "end": {
          "offset": 2287,
          "line": 68,
          "column": 1
        }
      }
    },
    {
      "type": "template",
      "name": "Addition",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2310,
          "line": 71,
          "column": 1
        },
        "end": {
          "offset": 2318,
          "line": 71,
          "column": 9
        }
      },
      "parameters": [
        {
          "type": "parameter",
          "name": "T",
          "location": {
            "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
            "start": {
              "offset": 2319,
              "line": 71,
              "column": 10
            },
            "end": {
              "offset": 2320,
              "line": 71,
              "column": 11
            }
          }
        }
      ],
      "expansions": [],
      "expression": {
        "type": "choice",
        "alternatives": [
          {
            "type": "action",
            "expression": {
              "type": "sequence",
              "elements": [
                {
                  "type": "labeled",
                  "label": "head",
                  "labelLocation": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2328,
                      "line": 72,
                      "column": 7
                    },
                    "end": {
                      "offset": 2332,
                      "line": 72,
                      "column": 11
                    }
                  },
                  "expression": {
                    "type": "expansion",
                    "name": "Multiplication",
                    "variables": [
                      {
                        "type": "variable_rule",
                        "name": "T",
                        "location": {
                          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                          "start": {
                            "offset": 2348,
                            "line": 72,
                            "column": 27
                          },
                          "end": {
                            "offset": 2349,
                            "line": 72,
                            "column": 28
                          }
                        }
                      }
                    ],
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2333,
                        "line": 72,
                        "column": 12
                      },
                      "end": {
                        "offset": 2350,
                        "line": 72,
                        "column": 29
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2328,
                      "line": 72,
                      "column": 7
                    },
                    "end": {
                      "offset": 2350,
                      "line": 72,
                      "column": 29
                    }
                  }
                },
                {
                  "type": "zero_or_more",
                  "expression": {
                    "type": "rule_ref",
                    "name": "ws",
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2351,
                        "line": 72,
                        "column": 30
                      },
                      "end": {
                        "offset": 2353,
                        "line": 72,
                        "column": 32
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2351,
                      "line": 72,
                      "column": 30
                    },
                    "end": {
                      "offset": 2354,
                      "line": 72,
                      "column": 33
                    }
                  }
                },
                {
                  "type": "labeled",
                  "label": "tail",
                  "labelLocation": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2355,
                      "line": 72,
                      "column": 34
                    },
                    "end": {
                      "offset": 2359,
                      "line": 72,
                      "column": 38
                    }
                  },
                  "expression": {
                    "type": "one_or_more",
                    "expression": {
                      "type": "group",
                      "expression": {
                        "type": "sequence",
                        "elements": [
                          {
                            "type": "zero_or_more",
                            "expression": {
                              "type": "rule_ref",
                              "name": "ws",
                              "location": {
                                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                "start": {
                                  "offset": 2362,
                                  "line": 72,
                                  "column": 41
                                },
                                "end": {
                                  "offset": 2364,
                                  "line": 72,
                                  "column": 43
                                }
                              }
                            },
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2362,
                                "line": 72,
                                "column": 41
                              },
                              "end": {
                                "offset": 2365,
                                "line": 72,
                                "column": 44
                              }
                            }
                          },
                          {
                            "type": "choice",
                            "alternatives": [
                              {
                                "type": "literal",
                                "value": "+",
                                "ignoreCase": false,
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2367,
                                    "line": 72,
                                    "column": 46
                                  },
                                  "end": {
                                    "offset": 2370,
                                    "line": 72,
                                    "column": 49
                                  }
                                }
                              },
                              {
                                "type": "literal",
                                "value": "-",
                                "ignoreCase": false,
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2373,
                                    "line": 72,
                                    "column": 52
                                  },
                                  "end": {
                                    "offset": 2376,
                                    "line": 72,
                                    "column": 55
                                  }
                                }
                              }
                            ],
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2367,
                                "line": 72,
                                "column": 46
                              },
                              "end": {
                                "offset": 2376,
                                "line": 72,
                                "column": 55
                              }
                            }
                          },
                          {
                            "type": "zero_or_more",
                            "expression": {
                              "type": "rule_ref",
                              "name": "ws",
                              "location": {
                                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                "start": {
                                  "offset": 2379,
                                  "line": 72,
                                  "column": 58
                                },
                                "end": {
                                  "offset": 2381,
                                  "line": 72,
                                  "column": 60
                                }
                              }
                            },
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2379,
                                "line": 72,
                                "column": 58
                              },
                              "end": {
                                "offset": 2382,
                                "line": 72,
                                "column": 61
                              }
                            }
                          },
                          {
                            "type": "expansion",
                            "name": "Multiplication",
                            "variables": [
                              {
                                "type": "variable_rule",
                                "name": "T",
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2398,
                                    "line": 72,
                                    "column": 77
                                  },
                                  "end": {
                                    "offset": 2399,
                                    "line": 72,
                                    "column": 78
                                  }
                                }
                              }
                            ],
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2383,
                                "line": 72,
                                "column": 62
                              },
                              "end": {
                                "offset": 2400,
                                "line": 72,
                                "column": 79
                              }
                            }
                          }
                        ],
                        "location": {
                          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                          "start": {
                            "offset": 2362,
                            "line": 72,
                            "column": 41
                          },
                          "end": {
                            "offset": 2400,
                            "line": 72,
                            "column": 79
                          }
                        }
                      },
                      "location": {
                        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                        "start": {
                          "offset": 2360,
                          "line": 72,
                          "column": 39
                        },
                        "end": {
                          "offset": 2401,
                          "line": 72,
                          "column": 80
                        }
                      }
                    },
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2360,
                        "line": 72,
                        "column": 39
                      },
                      "end": {
                        "offset": 2402,
                        "line": 72,
                        "column": 81
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2355,
                      "line": 72,
                      "column": 34
                    },
                    "end": {
                      "offset": 2402,
                      "line": 72,
                      "column": 81
                    }
                  }
                }
              ],
              "location": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 2328,
                  "line": 72,
                  "column": 7
                },
                "end": {
                  "offset": 2402,
                  "line": 72,
                  "column": 81
                }
              }
            },
            "code": "\n        return makeBinaryOperator(head, tail, 1, 3);\n    ",
            "codeLocation": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2404,
                "line": 72,
                "column": 83
              },
              "end": {
                "offset": 2462,
                "line": 74,
                "column": 5
              }
            },
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2328,
                "line": 72,
                "column": 7
              },
              "end": {
                "offset": 2463,
                "line": 74,
                "column": 6
              }
            }
          },
          {
            "type": "expansion",
            "name": "Multiplication",
            "variables": [
              {
                "type": "variable_rule",
                "name": "T",
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 2485,
                    "line": 75,
                    "column": 22
                  },
                  "end": {
                    "offset": 2486,
                    "line": 75,
                    "column": 23
                  }
                }
              }
            ],
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2470,
                "line": 75,
                "column": 7
              },
              "end": {
                "offset": 2487,
                "line": 75,
                "column": 24
              }
            }
          }
        ],
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 2328,
            "line": 72,
            "column": 7
          },
          "end": {
            "offset": 2487,
            "line": 75,
            "column": 24
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2310,
          "line": 71,
          "column": 1
        },
        "end": {
          "offset": 2488,
          "line": 76,
          "column": 1
        }
      }
    },
    {
      "type": "template",
      "name": "Multiplication",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2489,
          "line": 77,
          "column": 1
        },
        "end": {
          "offset": 2503,
          "line": 77,
          "column": 15
        }
      },
      "parameters": [
        {
          "type": "parameter",
          "name": "T",
          "location": {
            "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
            "start": {
              "offset": 2504,
              "line": 77,
              "column": 16
            },
            "end": {
              "offset": 2505,
              "line": 77,
              "column": 17
            }
          }
        }
      ],
      "expansions": [],
      "expression": {
        "type": "choice",
        "alternatives": [
          {
            "type": "action",
            "expression": {
              "type": "sequence",
              "elements": [
                {
                  "type": "labeled",
                  "label": "head",
                  "labelLocation": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2513,
                      "line": 78,
                      "column": 7
                    },
                    "end": {
                      "offset": 2517,
                      "line": 78,
                      "column": 11
                    }
                  },
                  "expression": {
                    "type": "expansion",
                    "name": "Exponentiation",
                    "variables": [
                      {
                        "type": "variable_rule",
                        "name": "T",
                        "location": {
                          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                          "start": {
                            "offset": 2533,
                            "line": 78,
                            "column": 27
                          },
                          "end": {
                            "offset": 2534,
                            "line": 78,
                            "column": 28
                          }
                        }
                      }
                    ],
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2518,
                        "line": 78,
                        "column": 12
                      },
                      "end": {
                        "offset": 2535,
                        "line": 78,
                        "column": 29
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2513,
                      "line": 78,
                      "column": 7
                    },
                    "end": {
                      "offset": 2535,
                      "line": 78,
                      "column": 29
                    }
                  }
                },
                {
                  "type": "zero_or_more",
                  "expression": {
                    "type": "rule_ref",
                    "name": "ws",
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2536,
                        "line": 78,
                        "column": 30
                      },
                      "end": {
                        "offset": 2538,
                        "line": 78,
                        "column": 32
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2536,
                      "line": 78,
                      "column": 30
                    },
                    "end": {
                      "offset": 2539,
                      "line": 78,
                      "column": 33
                    }
                  }
                },
                {
                  "type": "labeled",
                  "label": "tail",
                  "labelLocation": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2540,
                      "line": 78,
                      "column": 34
                    },
                    "end": {
                      "offset": 2544,
                      "line": 78,
                      "column": 38
                    }
                  },
                  "expression": {
                    "type": "one_or_more",
                    "expression": {
                      "type": "group",
                      "expression": {
                        "type": "sequence",
                        "elements": [
                          {
                            "type": "zero_or_more",
                            "expression": {
                              "type": "rule_ref",
                              "name": "ws",
                              "location": {
                                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                "start": {
                                  "offset": 2546,
                                  "line": 78,
                                  "column": 40
                                },
                                "end": {
                                  "offset": 2548,
                                  "line": 78,
                                  "column": 42
                                }
                              }
                            },
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2546,
                                "line": 78,
                                "column": 40
                              },
                              "end": {
                                "offset": 2549,
                                "line": 78,
                                "column": 43
                              }
                            }
                          },
                          {
                            "type": "choice",
                            "alternatives": [
                              {
                                "type": "literal",
                                "value": "*",
                                "ignoreCase": false,
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2551,
                                    "line": 78,
                                    "column": 45
                                  },
                                  "end": {
                                    "offset": 2554,
                                    "line": 78,
                                    "column": 48
                                  }
                                }
                              },
                              {
                                "type": "literal",
                                "value": "/",
                                "ignoreCase": false,
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2557,
                                    "line": 78,
                                    "column": 51
                                  },
                                  "end": {
                                    "offset": 2560,
                                    "line": 78,
                                    "column": 54
                                  }
                                }
                              },
                              {
                                "type": "literal",
                                "value": "%",
                                "ignoreCase": false,
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2563,
                                    "line": 78,
                                    "column": 57
                                  },
                                  "end": {
                                    "offset": 2566,
                                    "line": 78,
                                    "column": 60
                                  }
                                }
                              }
                            ],
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2551,
                                "line": 78,
                                "column": 45
                              },
                              "end": {
                                "offset": 2566,
                                "line": 78,
                                "column": 60
                              }
                            }
                          },
                          {
                            "type": "zero_or_more",
                            "expression": {
                              "type": "rule_ref",
                              "name": "ws",
                              "location": {
                                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                "start": {
                                  "offset": 2568,
                                  "line": 78,
                                  "column": 62
                                },
                                "end": {
                                  "offset": 2570,
                                  "line": 78,
                                  "column": 64
                                }
                              }
                            },
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2568,
                                "line": 78,
                                "column": 62
                              },
                              "end": {
                                "offset": 2571,
                                "line": 78,
                                "column": 65
                              }
                            }
                          },
                          {
                            "type": "expansion",
                            "name": "Exponentiation",
                            "variables": [
                              {
                                "type": "variable_rule",
                                "name": "T",
                                "location": {
                                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                                  "start": {
                                    "offset": 2587,
                                    "line": 78,
                                    "column": 81
                                  },
                                  "end": {
                                    "offset": 2588,
                                    "line": 78,
                                    "column": 82
                                  }
                                }
                              }
                            ],
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2572,
                                "line": 78,
                                "column": 66
                              },
                              "end": {
                                "offset": 2589,
                                "line": 78,
                                "column": 83
                              }
                            }
                          }
                        ],
                        "location": {
                          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                          "start": {
                            "offset": 2546,
                            "line": 78,
                            "column": 40
                          },
                          "end": {
                            "offset": 2589,
                            "line": 78,
                            "column": 83
                          }
                        }
                      },
                      "location": {
                        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                        "start": {
                          "offset": 2545,
                          "line": 78,
                          "column": 39
                        },
                        "end": {
                          "offset": 2590,
                          "line": 78,
                          "column": 84
                        }
                      }
                    },
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2545,
                        "line": 78,
                        "column": 39
                      },
                      "end": {
                        "offset": 2591,
                        "line": 78,
                        "column": 85
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2540,
                      "line": 78,
                      "column": 34
                    },
                    "end": {
                      "offset": 2591,
                      "line": 78,
                      "column": 85
                    }
                  }
                }
              ],
              "location": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 2513,
                  "line": 78,
                  "column": 7
                },
                "end": {
                  "offset": 2591,
                  "line": 78,
                  "column": 85
                }
              }
            },
            "code": "\n        return makeBinaryOperator(head, tail, 1, 3);\n    ",
            "codeLocation": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2593,
                "line": 78,
                "column": 87
              },
              "end": {
                "offset": 2651,
                "line": 80,
                "column": 5
              }
            },
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2513,
                "line": 78,
                "column": 7
              },
              "end": {
                "offset": 2652,
                "line": 80,
                "column": 6
              }
            }
          },
          {
            "type": "expansion",
            "name": "Exponentiation",
            "variables": [
              {
                "type": "variable_rule",
                "name": "T",
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 2674,
                    "line": 81,
                    "column": 22
                  },
                  "end": {
                    "offset": 2675,
                    "line": 81,
                    "column": 23
                  }
                }
              }
            ],
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2659,
                "line": 81,
                "column": 7
              },
              "end": {
                "offset": 2676,
                "line": 81,
                "column": 24
              }
            }
          }
        ],
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 2513,
            "line": 78,
            "column": 7
          },
          "end": {
            "offset": 2676,
            "line": 81,
            "column": 24
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2489,
          "line": 77,
          "column": 1
        },
        "end": {
          "offset": 2677,
          "line": 82,
          "column": 1
        }
      }
    },
    {
      "type": "template",
      "name": "Exponentiation",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2678,
          "line": 83,
          "column": 1
        },
        "end": {
          "offset": 2692,
          "line": 83,
          "column": 15
        }
      },
      "parameters": [
        {
          "type": "parameter",
          "name": "T",
          "location": {
            "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
            "start": {
              "offset": 2693,
              "line": 83,
              "column": 16
            },
            "end": {
              "offset": 2694,
              "line": 83,
              "column": 17
            }
          }
        }
      ],
      "expansions": [],
      "expression": {
        "type": "choice",
        "alternatives": [
          {
            "type": "action",
            "expression": {
              "type": "sequence",
              "elements": [
                {
                  "type": "labeled",
                  "label": "head",
                  "labelLocation": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2702,
                      "line": 84,
                      "column": 7
                    },
                    "end": {
                      "offset": 2706,
                      "line": 84,
                      "column": 11
                    }
                  },
                  "expression": {
                    "type": "rule_ref",
                    "name": "T",
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2707,
                        "line": 84,
                        "column": 12
                      },
                      "end": {
                        "offset": 2708,
                        "line": 84,
                        "column": 13
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2702,
                      "line": 84,
                      "column": 7
                    },
                    "end": {
                      "offset": 2708,
                      "line": 84,
                      "column": 13
                    }
                  }
                },
                {
                  "type": "labeled",
                  "label": "tail",
                  "labelLocation": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2709,
                      "line": 84,
                      "column": 14
                    },
                    "end": {
                      "offset": 2713,
                      "line": 84,
                      "column": 18
                    }
                  },
                  "expression": {
                    "type": "one_or_more",
                    "expression": {
                      "type": "group",
                      "expression": {
                        "type": "sequence",
                        "elements": [
                          {
                            "type": "literal",
                            "value": "**",
                            "ignoreCase": false,
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2716,
                                "line": 84,
                                "column": 21
                              },
                              "end": {
                                "offset": 2720,
                                "line": 84,
                                "column": 25
                              }
                            }
                          },
                          {
                            "type": "rule_ref",
                            "name": "T",
                            "location": {
                              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                              "start": {
                                "offset": 2722,
                                "line": 84,
                                "column": 27
                              },
                              "end": {
                                "offset": 2723,
                                "line": 84,
                                "column": 28
                              }
                            }
                          }
                        ],
                        "location": {
                          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                          "start": {
                            "offset": 2715,
                            "line": 84,
                            "column": 20
                          },
                          "end": {
                            "offset": 2723,
                            "line": 84,
                            "column": 28
                          }
                        }
                      },
                      "location": {
                        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                        "start": {
                          "offset": 2714,
                          "line": 84,
                          "column": 19
                        },
                        "end": {
                          "offset": 2724,
                          "line": 84,
                          "column": 29
                        }
                      }
                    },
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 2714,
                        "line": 84,
                        "column": 19
                      },
                      "end": {
                        "offset": 2725,
                        "line": 84,
                        "column": 30
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 2709,
                      "line": 84,
                      "column": 14
                    },
                    "end": {
                      "offset": 2725,
                      "line": 84,
                      "column": 30
                    }
                  }
                }
              ],
              "location": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 2702,
                  "line": 84,
                  "column": 7
                },
                "end": {
                  "offset": 2725,
                  "line": 84,
                  "column": 30
                }
              }
            },
            "code": "\n        return makeBinaryOperator(head, tail);\n    ",
            "codeLocation": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2727,
                "line": 84,
                "column": 32
              },
              "end": {
                "offset": 2779,
                "line": 86,
                "column": 5
              }
            },
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2702,
                "line": 84,
                "column": 7
              },
              "end": {
                "offset": 2780,
                "line": 86,
                "column": 6
              }
            }
          },
          {
            "type": "rule_ref",
            "name": "T",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2787,
                "line": 87,
                "column": 7
              },
              "end": {
                "offset": 2788,
                "line": 87,
                "column": 8
              }
            }
          }
        ],
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 2702,
            "line": 84,
            "column": 7
          },
          "end": {
            "offset": 2788,
            "line": 87,
            "column": 8
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2678,
          "line": 83,
          "column": 1
        },
        "end": {
          "offset": 2789,
          "line": 88,
          "column": 1
        }
      }
    },
    {
      "type": "rule",
      "name": "Expression",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2821,
          "line": 91,
          "column": 1
        },
        "end": {
          "offset": 2831,
          "line": 91,
          "column": 11
        }
      },
      "expression": {
        "type": "expansion",
        "name": "Addition",
        "variables": [
          {
            "type": "variable_rule",
            "name": "Term",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 2847,
                "line": 92,
                "column": 16
              },
              "end": {
                "offset": 2851,
                "line": 92,
                "column": 20
              }
            }
          }
        ],
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 2838,
            "line": 92,
            "column": 7
          },
          "end": {
            "offset": 2852,
            "line": 92,
            "column": 21
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2821,
          "line": 91,
          "column": 1
        },
        "end": {
          "offset": 2853,
          "line": 93,
          "column": 1
        }
      }
    },
    {
      "type": "rule",
      "name": "Term",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2996,
          "line": 99,
          "column": 1
        },
        "end": {
          "offset": 3000,
          "line": 99,
          "column": 5
        }
      },
      "expression": {
        "type": "choice",
        "alternatives": [
          {
            "type": "rule_ref",
            "name": "LabelledTerm",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3007,
                "line": 100,
                "column": 7
              },
              "end": {
                "offset": 3019,
                "line": 100,
                "column": 19
              }
            }
          },
          {
            "type": "rule_ref",
            "name": "UnlabelledTerm",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3026,
                "line": 101,
                "column": 7
              },
              "end": {
                "offset": 3040,
                "line": 101,
                "column": 21
              }
            }
          }
        ],
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 3007,
            "line": 100,
            "column": 7
          },
          "end": {
            "offset": 3040,
            "line": 101,
            "column": 21
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 2996,
          "line": 99,
          "column": 1
        },
        "end": {
          "offset": 3041,
          "line": 102,
          "column": 1
        }
      }
    },
    {
      "type": "rule",
      "name": "LabelledTerm",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3042,
          "line": 103,
          "column": 1
        },
        "end": {
          "offset": 3054,
          "line": 103,
          "column": 13
        }
      },
      "expression": {
        "type": "action",
        "expression": {
          "type": "sequence",
          "elements": [
            {
              "type": "labeled",
              "label": "term",
              "labelLocation": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 3061,
                  "line": 104,
                  "column": 7
                },
                "end": {
                  "offset": 3065,
                  "line": 104,
                  "column": 11
                }
              },
              "expression": {
                "type": "rule_ref",
                "name": "UnlabelledTerm",
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3066,
                    "line": 104,
                    "column": 12
                  },
                  "end": {
                    "offset": 3080,
                    "line": 104,
                    "column": 26
                  }
                }
              },
              "location": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 3061,
                  "line": 104,
                  "column": 7
                },
                "end": {
                  "offset": 3080,
                  "line": 104,
                  "column": 26
                }
              }
            },
            {
              "type": "zero_or_more",
              "expression": {
                "type": "rule_ref",
                "name": "ws",
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3081,
                    "line": 104,
                    "column": 27
                  },
                  "end": {
                    "offset": 3083,
                    "line": 104,
                    "column": 29
                  }
                }
              },
              "location": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 3081,
                  "line": 104,
                  "column": 27
                },
                "end": {
                  "offset": 3084,
                  "line": 104,
                  "column": 30
                }
              }
            },
            {
              "type": "labeled",
              "label": "label",
              "labelLocation": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 3085,
                  "line": 104,
                  "column": 31
                },
                "end": {
                  "offset": 3090,
                  "line": 104,
                  "column": 36
                }
              },
              "expression": {
                "type": "rule_ref",
                "name": "Label",
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3091,
                    "line": 104,
                    "column": 37
                  },
                  "end": {
                    "offset": 3096,
                    "line": 104,
                    "column": 42
                  }
                }
              },
              "location": {
                "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                "start": {
                  "offset": 3085,
                  "line": 104,
                  "column": 31
                },
                "end": {
                  "offset": 3096,
                  "line": 104,
                  "column": 42
                }
              }
            }
          ],
          "location": {
            "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
            "start": {
              "offset": 3061,
              "line": 104,
              "column": 7
            },
            "end": {
              "offset": 3096,
              "line": 104,
              "column": 42
            }
          }
        },
        "code": "\n        term[\"label\"] = label;\n        return term;\n    ",
        "codeLocation": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 3098,
            "line": 104,
            "column": 44
          },
          "end": {
            "offset": 3155,
            "line": 107,
            "column": 5
          }
        },
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 3061,
            "line": 104,
            "column": 7
          },
          "end": {
            "offset": 3156,
            "line": 107,
            "column": 6
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3042,
          "line": 103,
          "column": 1
        },
        "end": {
          "offset": 3157,
          "line": 108,
          "column": 1
        }
      }
    },
    {
      "type": "rule",
      "name": "Label",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3158,
          "line": 109,
          "column": 1
        },
        "end": {
          "offset": 3163,
          "line": 109,
          "column": 6
        }
      },
      "expression": {
        "type": "named",
        "name": "inline label",
        "expression": {
          "type": "action",
          "expression": {
            "type": "sequence",
            "elements": [
              {
                "type": "literal",
                "value": "[",
                "ignoreCase": false,
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3185,
                    "line": 110,
                    "column": 7
                  },
                  "end": {
                    "offset": 3188,
                    "line": 110,
                    "column": 10
                  }
                }
              },
              {
                "type": "labeled",
                "label": "label",
                "labelLocation": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3189,
                    "line": 110,
                    "column": 11
                  },
                  "end": {
                    "offset": 3194,
                    "line": 110,
                    "column": 16
                  }
                },
                "expression": {
                  "type": "zero_or_more",
                  "expression": {
                    "type": "class",
                    "parts": [
                      "[",
                      "]"
                    ],
                    "inverted": true,
                    "ignoreCase": false,
                    "location": {
                      "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                      "start": {
                        "offset": 3195,
                        "line": 110,
                        "column": 17
                      },
                      "end": {
                        "offset": 3201,
                        "line": 110,
                        "column": 23
                      }
                    }
                  },
                  "location": {
                    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                    "start": {
                      "offset": 3195,
                      "line": 110,
                      "column": 17
                    },
                    "end": {
                      "offset": 3202,
                      "line": 110,
                      "column": 24
                    }
                  }
                },
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3189,
                    "line": 110,
                    "column": 11
                  },
                  "end": {
                    "offset": 3202,
                    "line": 110,
                    "column": 24
                  }
                }
              },
              {
                "type": "literal",
                "value": "]",
                "ignoreCase": false,
                "location": {
                  "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
                  "start": {
                    "offset": 3203,
                    "line": 110,
                    "column": 25
                  },
                  "end": {
                    "offset": 3206,
                    "line": 110,
                    "column": 28
                  }
                }
              }
            ],
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3185,
                "line": 110,
                "column": 7
              },
              "end": {
                "offset": 3206,
                "line": 110,
                "column": 28
              }
            }
          },
          "code": "\n        return label;\n    ",
          "codeLocation": {
            "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
            "start": {
              "offset": 3208,
              "line": 110,
              "column": 30
            },
            "end": {
              "offset": 3235,
              "line": 112,
              "column": 5
            }
          },
          "location": {
            "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
            "start": {
              "offset": 3185,
              "line": 110,
              "column": 7
            },
            "end": {
              "offset": 3236,
              "line": 112,
              "column": 6
            }
          }
        },
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 3158,
            "line": 109,
            "column": 1
          },
          "end": {
            "offset": 3237,
            "line": 113,
            "column": 1
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3158,
          "line": 109,
          "column": 1
        },
        "end": {
          "offset": 3237,
          "line": 113,
          "column": 1
        }
      }
    },
    {
      "type": "rule",
      "name": "UnlabelledTerm",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3490,
          "line": 119,
          "column": 1
        },
        "end": {
          "offset": 3504,
          "line": 119,
          "column": 15
        }
      },
      "expression": {
        "type": "choice",
        "alternatives": [
          {
            "type": "rule_ref",
            "name": "DiceRoll",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3511,
                "line": 120,
                "column": 7
              },
              "end": {
                "offset": 3519,
                "line": 120,
                "column": 15
              }
            }
          },
          {
            "type": "rule_ref",
            "name": "FunctionCall",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3526,
                "line": 121,
                "column": 7
              },
              "end": {
                "offset": 3538,
                "line": 121,
                "column": 19
              }
            }
          },
          {
            "type": "rule_ref",
            "name": "Parens",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3545,
                "line": 122,
                "column": 7
              },
              "end": {
                "offset": 3551,
                "line": 122,
                "column": 13
              }
            }
          },
          {
            "type": "rule_ref",
            "name": "Integer",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3558,
                "line": 123,
                "column": 7
              },
              "end": {
                "offset": 3565,
                "line": 123,
                "column": 14
              }
            }
          },
          {
            "type": "rule_ref",
            "name": "Number",
            "location": {
              "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
              "start": {
                "offset": 3572,
                "line": 124,
                "column": 7
              },
              "end": {
                "offset": 3578,
                "line": 124,
                "column": 13
              }
            }
          }
        ],
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 3511,
            "line": 120,
            "column": 7
          },
          "end": {
            "offset": 3578,
            "line": 124,
            "column": 13
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3490,
          "line": 119,
          "column": 1
        },
        "end": {
          "offset": 3579,
          "line": 125,
          "column": 1
        }
      }
    },
    {
      "type": "rule",
      "name": "DiceRoll",
      "nameLocation": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3596,
          "line": 128,
          "column": 1
        },
        "end": {
          "offset": 3604,
          "line": 128,
          "column": 9
        }
      },
      "expression": {
        "type": "any",
        "location": {
          "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
          "start": {
            "offset": 3611,
            "line": 129,
            "column": 7
          },
          "end": {
            "offset": 3612,
            "line": 129,
            "column": 8
          }
        }
      },
      "location": {
        "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
        "start": {
          "offset": 3596,
          "line": 128,
          "column": 1
        },
        "end": {
          "offset": 3613,
          "line": 130,
          "column": 1
        }
      }
    }
  ],
  "location": {
    "source": "crp_utils/grammars/roll20_rolls_simple.pegjs",
    "start": {
      "offset": 0,
      "line": 1,
      "column": 1
    },
    "end": {
      "offset": 8628,
      "line": 344,
      "column": 15
    }
  }
}
{{  const KEEP_DROP_WHICH = {"h": "high", "l": "low"};
  const SORT_ORDER = {"a": "ascending", "d": "descending"};
  
  function makeBinaryOperator(head, tail, operatorIndex=0, rightIndex=1) {
      return tail.reduce(
          function (left, array) {
              return {
                  type: "binary_operator",
                  operator: array[operatorIndex],
                  left: left,
                  right: array[rightIndex]
              };
          },
          head
      );
  }
  
  function makeFunctionCall(name, expression) {
      return {
          type: "function_call",
          name: name,
          argument: expression
      };
  }
  
  function makeDiceModifier(name, compare_point=null) {
      obj = {
          type: "modifier",
          name: name
      };
      if (compare_point) {
          obj.compare_point = compare_point.operator;
      }
      return obj;
  }}}




Start
  = Expression

Addition
  = head:Multiplication ws* tail:(ws* "+" / "-" ws* Multiplication)+
    {
      return makeBinaryOperator(head, tail, 1, 3);
    }
  / Multiplication

Multiplication
  = head:Exponentiation ws* tail:(ws* "*" / "/" / "%" ws* Exponentiation)+
    {
      return makeBinaryOperator(head, tail, 1, 3);
    }
  / Exponentiation

Exponentiation
  = head:T tail:("**" T)+
    {
      return makeBinaryOperator(head, tail);
    }
  / T

Expression
  = Addition

Term
  = LabelledTerm / UnlabelledTerm

LabelledTerm
  = term:UnlabelledTerm ws* label:Label
  {
    term["label"] = label;
    return term;
  }

Label "inline label"
  = "[" label:[^\[\]]* "]"
  {
    return label;
  }

UnlabelledTerm
  = DiceRoll / FunctionCall / Parens / Integer / Number

DiceRoll
  = .
