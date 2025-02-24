Nfw.registerConfig({
    config = {
        ['jobIntermedGeneralConfig'] = {
            garbageman = true,
            farmer = true,
            scubaDiver = true,

            ['garbagemanConfig'] = {
                paymentType = {
                    money = false,
                    itens = true
                },
                
                minMoney = 50,
                maxMoney = 100,
                
                paymentItensType = 1,
                --  1 = todos itens
                --  2 = item randomico,
                
                paymentItens = {
                    {item = 'laranja', min = 1, max = 1},
                },
                
                jobVehicles = {
                    [`trash`] = true,
                    [`trash2`] = true,
                },
                
                garbageCollectBlipConfig = {
                    sprite = 318,
                    colour = 1,
                    scale = 0.6,
                    routeColor = 5,
                    text = 'Coletar lixo'
                },
                
                garbageProps = {
                    [`prop_dumpster_01a`] = true,
                    [`prop_dumpster_02a`] = true,
                    [`prop_dumpster_02b`] = true,
                    [`prop_dumpster_3a`] = true,
                    [`prop_dumpster_4a`] = true,
                    [`prop_dumpster_4b`] = true
                },
                 
                resetTime = 1, -- minutos
                
                garbageV2Marker = {
                    ['type'] = 21,
                    ['scalex'] = 1.0,
                    ['scaley'] = 1.0,
                    ['scalez'] = 1.0,
                    ['r'] = 255,
                    ['g'] = 0,
                    ['b'] = 0,
                    ['a'] = 150,
                    ['bobUpAndDown'] = true,
                },
            },

            ['farmerConfig'] = {
                requirePayment = {
                    ['cow'] = {
                        requireItem = true,
                        requireItemData = {
                            {item = 'garrafavazia', qtd = 1},
                        },
                        paymentType = {
                            money = true, 
                            itens = true
                        },
                        paymentMoney = {
                            min = 100,
                            max = 200
                        },
                        paymentItemType = 1,
                        paymentItem = {
                            {item = 'garrafadeleite', min = 1, max = 1},
                        }
                    },
                    ['orange'] = {
                        requireItem = false,
                        requireItemData = {
                            --{item = 'garrafavazia', qtd = 1}
                        },
                        paymentType = {
                            money = false, 
                            itens = true
                        },
                        paymentMoney = {
                            min = 100,
                            max = 200
                        },
                        paymentItemType = 1,
                        paymentItem = {
                            {item = 'laranja', min = 1, max = 1},
                        }
                    },
                    ['tomato'] = {
                        requireItem = false,
                        requireItemData = {
                            --{item = 'garrafavazia', qtd = 1}
                        },
                        paymentType = {
                            money = false, 
                            itens = true
                        },
                        paymentMoney = {
                            min = 100,
                            max = 200
                        },
                        paymentItemType = 1,
                        paymentItem = {
                            {item = 'garrafadeleite', min = 1, max = 1},
                        }
                    }
                },
                
                resetLocationTime = 1, -- minutos
                
                farmerMarker = {
                    ['type'] = 21,
                    ['scalex'] = 1.0,
                    ['scaley'] = 1.0,
                    ['scalez'] = 1.0,
                    ['r'] = 255,
                    ['g'] = 0,
                    ['b'] = 0,
                    ['a'] = 150,
                    ['bobUpAndDown'] = true,
                    ['rotate'] = true
                },
                
                -- types = apple orange  tomato  cow
                --         maça  laranja tomate  vaca
                
                collectFarmerLocations = {
                    { cds = vector3(1469.11, 1152.38, 114.32), type = 'cow' },
                
                    -- LARANJA -----------------------------------------
                    { cds = vector3(2305.38,4997.24,42.3), type = 'orange' },
                    { cds = vector3(2316.33,4994.06,42.06), type = 'orange' },
                    { cds = vector3(2317.58,4984.87,41.81), type = 'orange' },
                    { cds = vector3(2334.77,4976.06,42.59), type = 'orange' },
                    { cds = vector3(2348.3,4975.75,42.74), type = 'orange' },
                    { cds = vector3(2361.57,4977.34,43.23), type = 'orange' },
                    { cds = vector3(2349.35,4988.59,43.03), type = 'orange' },
                    { cds = vector3(2332.36,4996.49,42.14), type = 'orange' },
                    { cds = vector3(2330.29,5007.45,42.34), type = 'orange' },
                    { cds = vector3(2317.39,5008.86,42.51), type = 'orange' },
                    { cds = vector3(2316.58,5022.86,43.27), type = 'orange' },
                    { cds = vector3(2329.89,5022.12,42.94), type = 'orange' },
                    { cds = vector3(2329.75,5036.6,44.39), type = 'orange' },
                    { cds = vector3(2341.25,5035.39,44.34), type = 'orange' },
                    { cds = vector3(2343.47,5023.1,43.53), type = 'orange' },
                    { cds = vector3(2344.03,5007.71,42.71), type = 'orange' },
                    { cds = vector3(2356.78,5019.91,43.82), type = 'orange' },
                    { cds = vector3(2369.85,5011.47,44.41), type = 'orange' },
                    { cds = vector3(2361.0,5002.94,43.46), type = 'orange' },
                    { cds = vector3(2378.47,5003.81,44.69), type = 'orange' },
                    { cds = vector3(2374.62,4989.24,44.04), type = 'orange' },
                    { cds = vector3(2374.62,4989.24,44.04), type = 'orange' },
                    { cds = vector3(2389.19,4991.5,45.11), type = 'orange' },
                    { cds = vector3(2376.67,5017.21,45.47), type = 'orange' },
                    { cds = vector3(2388.89,5005.24,45.72), type = 'orange' },
                    { cds = vector3(2424.14,4658.12,33.46), type = "orange" },
                    { cds = vector3(2443.02,4672.55,33.33), type = "orange" },
                    { cds = vector3(2434.33,4679.37,33.38), type = "orange" },
                    { cds = vector3(2420.34,4673.63,33.85), type = "orange" },
                    { cds = vector3(2422.31,4686.15,33.71), type = "orange" },
                    { cds = vector3(2424.22,4698.26,33.04), type = "orange" },
                    { cds = vector3(2407.03,4677.4,33.96), type = "orange" },
                    { cds = vector3(2401.84,4687.76,33.69), type = "orange" },
                    { cds = vector3(2412.29,4707.46,33.0), type = "orange" },
                    { cds = vector3(2404.96,4704.18,33.35), type = "orange" },
                    { cds = vector3(2389.78,4690.59,33.94), type = "orange" },
                    { cds = vector3(2382.16,4700.52,33.93), type = "orange" },
                    { cds = vector3(2382.4,4712.39,33.76), type = "orange" },
                    { cds = vector3(2401.41,4716.52,33.17), type = "orange" },
                    { cds = vector3(2387.77,4723.68,33.63), type = "orange" },
                    { cds = vector3(2387.74,4734.82,33.24), type = "orange" },
                    { cds = vector3(2367.32,4715.62,34.29), type = "orange" },
                    { cds = vector3(2364.87,4729.16,34.18), type = "orange" },
                    { cds = vector3(2359.45,4724.26,34.55), type = "orange" },
                    { cds = vector3(2375.13,4734.81,33.69), type = "orange" },
                    { cds = vector3(2366.84,4750.56,33.9), type = "orange" },
                    { cds = vector3(2350.46,4733.22,34.85), type = "orange" },
                    { cds = vector3(2339.84,4740.99,35.07), type = "orange" },
                    { cds = vector3(2343.95,4755.29,34.78), type = "orange" },
                    { cds = vector3(2353.3,4759.98,34.35), type = "orange" },
                    { cds = vector3(2339.35,4767.81,35.19), type = "orange" },
                    { cds = vector3(2326.23,4761.4,35.95), type = "orange" },
                    { cds = vector3(2327.44,4770.36,36.06), type = "orange" },
                    { cds = vector3(2324.28,4747.22,36.05), type = "orange" },
                    { cds = vector3(2146.73,4867.87,40.59), type = "orange" },
                    { cds = vector3(2123.44,4884.11,40.88), type = "orange" },
                    { cds = vector3(2121.94,4862.89,41.06), type = "orange" },
                    { cds = vector3(2102.54,4877.71,41.05), type = "orange" },
                    { cds = vector3(2117.57,4842.68,41.56), type = "orange" },
                    { cds = vector3(2098.79,4841.66,41.65), type = "orange" },
                    { cds = vector3(2084.56,4852.94,41.91), type = "orange" },
                    { cds = vector3(2086.69,4824.93,41.57), type = "orange" },
                    { cds = vector3(2064.39,4819.89,41.84), type = "orange" },
                    { cds = vector3(2059.73,4842.55,41.83), type = "orange" },
                    { cds = vector3(2031.52,4801.72,41.86), type = "orange" },
                    { cds = vector3(2015.42,4800.48,41.97), type = "orange" },
                    { cds = vector3(2002.56,4786.63,41.79), type = "orange" },
                    { cds = vector3(1981.98,4772.42,41.92), type = "orange" },
                    { cds = vector3(2361.06,4988.48,43.30), type = "orange" },
                    
                    
                
                    -- TOMATE --------------------------------------
                    
                    { cds = vector3(1896.81,5104.9,47.02), type = "tomato" },
                    { cds = vector3(1895.69,5104.03,47.2), type = "tomato" },
                    { cds = vector3(1894.28,5103.1,47.36), type = "tomato" },
                    { cds = vector3(1893.18,5101.91,47.64), type = "tomato" },
                    { cds = vector3(1892.29,5101.21,47.79), type = "tomato" },
                    { cds = vector3(1891.11,5100.54,47.93), type = "tomato" },
                    { cds = vector3(1833.19,5050.62,58.16), type = "tomato" },
                    { cds = vector3(1832.19,5049.8,58.25), type = "tomato" },
                    { cds = vector3(1830.87,5048.73,58.39), type = "tomato" },
                    { cds = vector3(1829.71,5047.72,58.52), type = "tomato" },
                    { cds = vector3(1828.71,5047.13,58.55), type = "tomato" },
                    { cds = vector3(1827.75,5046.1,58.71), type = "tomato" },
                    { cds = vector3(1831.25,5040.68,58.5), type = "tomato" },
                    { cds = vector3(1832.41,5041.79,58.33), type = "tomato" },
                    { cds = vector3(1833.72,5042.33,58.33), type = "tomato" },
                    { cds = vector3(1834.76,5043.62,58.19), type = "tomato" },
                    { cds = vector3(1835.96,5044.67,58.07), type = "tomato" },
                    { cds = vector3(1837.16,5045.64,57.93), type = "tomato" },
                    { cds = vector3(1902.87,5101.76,45.92), type = "tomato" },
                    { cds = vector3(1904.06,5102.92,45.59), type = "tomato" },
                    { cds = vector3(1905.33,5103.64,45.42), type = "tomato" },
                    { cds = vector3(1906.47,5104.75,45.16), type = "tomato" },
                    { cds = vector3(1907.45,5105.64,44.93), type = "tomato" },
                    { cds = vector3(1908.62,5106.51,44.71), type = "tomato" },
                    { cds = vector3(1922.36,5106.04,41.95), type = "tomato" },
                    { cds = vector3(1921.39,5105.19,42.22), type = "tomato" },
                    { cds = vector3(1920.36,5104.31,42.5), type = "tomato" },
                    { cds = vector3(1918.97,5103.28,42.86), type = "tomato" },
                    { cds = vector3(1918.02,5102.51,43.1), type = "tomato" },
                    { cds = vector3(1916.92,5101.75,43.26), type = "tomato" },
                    { cds = vector3(1843.56,5039.09,56.49), type = "tomato" },
                    { cds = vector3(1842.55,5038.35,56.6), type = "tomato" },
                    { cds = vector3(1841.34,5037.14,56.82), type = "tomato" },
                    { cds = vector3(1840.05,5036.03,57.02), type = "tomato" },
                    { cds = vector3(1838.89,5035.44,57.15), type = "tomato" },
                    { cds = vector3(1838.2,5034.53,57.26), type = "tomato" },
                    { cds = vector3(1841.57,5029.01,56.34), type = "tomato" },
                    { cds = vector3(1843.13,5030.04,56.14), type = "tomato" },
                    { cds = vector3(1844.11,5030.7,56.0), type = "tomato" },
                    { cds = vector3(1845.17,5031.6,55.8), type = "tomato" },
                    { cds = vector3(1846.24,5032.52,55.61), type = "tomato" },
                    { cds = vector3(1847.24,5033.4,55.44), type = "tomato" },
                    { cds = vector3(1921.14,5096.54,43.04), type = "tomato" },
                    { cds = vector3(1922.37,5097.31,42.81), type = "tomato" },
                    { cds = vector3(1923.32,5098.16,42.58), type = "tomato" },
                    { cds = vector3(1924.38,5099.04,42.33), type = "tomato" },
                    { cds = vector3(1925.44,5100.0,42.07), type = "tomato" },
                    { cds = vector3(1926.71,5101.06,41.76), type = "tomato" },
                    { cds = vector3(1930.31,5095.63,41.81), type = "tomato" },
                    { cds = vector3(1929.0,5094.63,42.14), type = "tomato" },
                    { cds = vector3(1927.51,5093.35,42.53), type = "tomato" },
                    { cds = vector3(1926.53,5092.49,42.77), type = "tomato" },
                    { cds = vector3(1925.78,5091.84,42.91), type = "tomato" },
                    { cds = vector3(1924.77,5090.98,43.08), type = "tomato" },
                    { cds = vector3(1852.36,5029.16,54.37), type = "tomato" },
                    { cds = vector3(1851.14,5028.05,54.59), type = "tomato" },
                    { cds = vector3(1850.19,5027.23,54.74), type = "tomato" },
                    { cds = vector3(1848.92,5026.14,54.91), type = "tomato" },
                    { cds = vector3(1848.09,5025.57,55.03), type = "tomato" },
                    { cds = vector3(1846.79,5024.43,55.22), type = "tomato" },
                    { cds = vector3(1858.02,5021.88,53.22), type = "tomato" },
                    { cds = vector3(1859.09,5023.05,53.09), type = "tomato" },
                    { cds = vector3(1860.15,5023.7,52.95), type = "tomato" },
                    { cds = vector3(1861.33,5024.71,52.79), type = "tomato" },
                    { cds = vector3(1862.55,5025.74,52.6), type = "tomato" },
                    { cds = vector3(1863.77,5026.79,52.42), type = "tomato" },
                    { cds = vector3(1930.91,5084.05,42.79), type = "tomato" },
                    { cds = vector3(1932.25,5085.25,42.56), type = "tomato" },
                    { cds = vector3(1934.05,5086.73,42.2), type = "tomato" },
                    { cds = vector3(1935.31,5087.93,41.93), type = "tomato" },
                    { cds = vector3(1936.24,5088.97,41.67), type = "tomato" },
                    { cds = vector3(1941.5,5084.54,41.44), type = "tomato" },
                    { cds = vector3(1940.37,5083.81,41.61), type = "tomato" },
                    { cds = vector3(1939.13,5082.52,41.87), type = "tomato" },
                    { cds = vector3(1938.06,5081.6,42.06), type = "tomato" },
                    { cds = vector3(1937.07,5080.79,42.23), type = "tomato" },
                    { cds = vector3(1936.06,5079.96,42.38), type = "tomato" },
                    { cds = vector3(1880.23,5032.44,49.88), type = "tomato" },
                    { cds = vector3(1879.16,5031.49,49.95), type = "tomato" },
                    { cds = vector3(1877.85,5030.37,50.06), type = "tomato" },
                    { cds = vector3(1876.7,5029.39,50.15), type = "tomato" },
                    { cds = vector3(1875.79,5028.62,50.23), type = "tomato" },
                    { cds = vector3(1874.51,5027.69,50.39), type = "tomato" },
                    { cds = vector3(1834.69,4992.75,53.56), type = "tomato" },
                    { cds = vector3(1833.75,4991.97,53.37), type = "tomato" },
                    { cds = vector3(1832.52,4990.99,53.08), type = "tomato" },
                    { cds = vector3(1831.31,4989.95,52.79), type = "tomato" },
                    { cds = vector3(1830.46,4989.22,52.58), type = "tomato" },
                    { cds = vector3(1829.32,4988.21,52.29), type = "tomato" },
                    { cds = vector3(1815.58,5015.32,57.06), type = "tomato" },
                    { cds = vector3(1814.49,5014.24,56.79), type = "tomato" },
                    { cds = vector3(1813.47,5013.48,56.59), type = "tomato" },
                    { cds = vector3(1811.86,5012.13,56.24), type = "tomato" },
                    { cds = vector3(1811.12,5011.49,56.07), type = "tomato" },
                    { cds = vector3(1810.08,5010.61,55.85), type = "tomato" },
                    { cds = vector3(1809.85,5022.94,57.83), type = "tomato" },
                    { cds = vector3(1808.6,5021.53,57.6), type = "tomato" },
                    { cds = vector3(1807.36,5020.48,57.35), type = "tomato" },
                    { cds = vector3(1806.27,5019.54,57.14), type = "tomato" },
                    { cds = vector3(1805.23,5018.65,56.95), type = "tomato" },
                    { cds = vector3(1804.24,5017.81,56.74), type = "tomato" },
                    { cds = vector3(1751.33,4980.3,48.58), type = "tomato" },
                    { cds = vector3(1752.41,4981.23,48.78), type = "tomato" },
                    { cds = vector3(1753.14,4981.84,48.91), type = "tomato" },
                    { cds = vector3(1754.41,4982.92,49.15), type = "tomato" },
                    { cds = vector3(1755.46,4983.82,49.34), type = "tomato" },
                    { cds = vector3(1757.1,4985.22,49.6), type = "tomato" },
                    { cds = vector3(1761.14,4988.86,50.22), type = "tomato" },
                    { cds = vector3(1762.21,4989.78,50.36), type = "tomato" },
                    { cds = vector3(1763.14,4990.61,50.49), type = "tomato" },
                    { cds = vector3(1764.38,4991.68,50.67), type = "tomato" },
                    { cds = vector3(1765.56,4992.7,50.85), type = "tomato" },
                    { cds = vector3(1766.49,4993.48,50.98), type = "tomato" },
                    { cds = vector3(1770.37,4997.54,51.58), type = "tomato" },
                    { cds = vector3(1771.74,4998.43,51.88), type = "tomato" },
                    { cds = vector3(1772.59,4999.1,52.05), type = "tomato" },
                    { cds = vector3(1773.96,5000.05,52.29), type = "tomato" },
                    { cds = vector3(1775.19,5001.09,52.48), type = "tomato" },
                    { cds = vector3(1776.3,5002.04,52.65), type = "tomato" },
                    { cds = vector3(1789.86,5013.58,55.03), type = "tomato" },
                    { cds = vector3(1791.05,5014.73,55.29), type = "tomato" },
                    { cds = vector3(1792.29,5015.77,55.53), type = "tomato" },
                    { cds = vector3(1793.24,5016.59,55.72), type = "tomato" },
                    { cds = vector3(1794.5,5017.66,55.99), type = "tomato" },
                    { cds = vector3(1795.76,5018.72,56.26), type = "tomato" },
                    { cds = vector3(1799.51,5022.19,57.14), type = "tomato" },
                    { cds = vector3(1801.17,5023.7,57.51), type = "tomato" },
                    { cds = vector3(1801.92,5024.27,57.66), type = "tomato" },
                    { cds = vector3(1803.09,5025.27,57.9), type = "tomato" },
                    { cds = vector3(1804.17,5026.04,58.1), type = "tomato" },
                    { cds = vector3(1805.16,5027.02,58.32), type = "tomato" },
                    { cds = vector3(1829.89,4999.01,54.17), type = "tomato" },
                    { cds = vector3(1828.74,4998.13,53.89), type = "tomato" },
                    { cds = vector3(1827.94,4996.63,53.74), type = "tomato" },
                    { cds = vector3(1826.93,4995.77,53.51), type = "tomato" },
                    { cds = vector3(1826.0,4994.97,53.29), type = "tomato" },
                    { cds = vector3(1824.88,4994.02,53.04), type = "tomato" },
                    { cds = vector3(1937.09,4910.98,46.23), type = "tomato" },
                    { cds = vector3(1938.64,4910.06,46.12), type = "tomato" },
                    { cds = vector3(1939.79,4909.31,45.99), type = "tomato" },
                    { cds = vector3(1941.07,4908.08,45.89), type = "tomato" },
                    { cds = vector3(1942.06,4907.04,45.81), type = "tomato" },
                    { cds = vector3(1943.01,4906.06,45.75), type = "tomato" },
                    { cds = vector3(1947.61,4901.89,45.46), type = "tomato" },
                    { cds = vector3(1948.7,4900.84,45.41), type = "tomato" },
                    { cds = vector3(1949.63,4899.88,45.37), type = "tomato" },
                    { cds = vector3(1950.77,4898.7,45.34), type = "tomato" },
                    { cds = vector3(1951.82,4897.61,45.32), type = "tomato" },
                    { cds = vector3(1952.93,4896.47,45.31), type = "tomato" },
                    { cds = vector3(1950.67,4888.77,45.83), type = "tomato" },
                    { cds = vector3(1949.67,4889.88,45.86), type = "tomato" },
                    { cds = vector3(1948.76,4891.24,45.71), type = "tomato" },
                    { cds = vector3(1947.61,4892.43,45.7), type = "tomato" },
                    { cds = vector3(1946.89,4893.17,45.72), type = "tomato" },
                    { cds = vector3(1945.94,4894.15,45.75), type = "tomato" },
                    { cds = vector3(1922.11,4908.71,47.84), type = "tomato" },
                    { cds = vector3(1923.36,4907.66,47.84), type = "tomato" },
                    { cds = vector3(1924.02,4906.97,47.78), type = "tomato" },
                    { cds = vector3(1925.18,4905.75,47.67), type = "tomato" },
                    { cds = vector3(1926.31,4904.58,47.56), type = "tomato" },
                    { cds = vector3(1927.21,4903.64,47.44), type = "tomato" },
                    { cds = vector3(1940.47,4890.39,46.29), type = "tomato" },
                    { cds = vector3(1941.42,4889.24,46.25), type = "tomato" },
                    { cds = vector3(1942.23,4888.51,46.23), type = "tomato" },
                    { cds = vector3(1943.27,4887.6,46.21), type = "tomato" },
                    { cds = vector3(1944.24,4886.35,46.19), type = "tomato" },
                    { cds = vector3(1945.34,4885.16,46.16), type = "tomato" },
                    { cds = vector3(1919.51,4895.7,47.54), type = "tomato" },
                    { cds = vector3(1918.48,4896.69,47.59), type = "tomato" },
                    { cds = vector3(1917.58,4897.56,47.68), type = "tomato" },
                    { cds = vector3(1916.48,4898.63,47.78), type = "tomato" },
                    { cds = vector3(1915.28,4899.8,47.89), type = "tomato" },
                    { cds = vector3(1914.24,4900.6,47.97), type = "tomato" },
                    { cds = vector3(1907.49,4894.05,47.83), type = "tomato" },
                    { cds = vector3(1908.99,4892.91,47.77), type = "tomato" },
                    { cds = vector3(1910.01,4892.01,47.73), type = "tomato" },
                    { cds = vector3(1911.18,4890.87,47.67), type = "tomato" },
                    { cds = vector3(1912.16,4889.92,47.63), type = "tomato" },
                    { cds = vector3(1913.34,4888.78,47.56), type = "tomato" },
                    { cds = vector3(1928.4,4873.93,47.08), type = "tomato" },
                    { cds = vector3(1929.26,4873.01,47.07), type = "tomato" },
                    { cds = vector3(1930.02,4872.23,47.07), type = "tomato" },
                    { cds = vector3(1931.21,4870.99,47.08), type = "tomato" },
                    { cds = vector3(1932.17,4870.0,47.09), type = "tomato" },
                    { cds = vector3(1933.19,4868.93,47.11), type = "tomato" },
                    { cds = vector3(1929.9,4864.21,47.03), type = "tomato" },
                    { cds = vector3(1928.98,4865.12,47.03), type = "tomato" },
                    { cds = vector3(1927.72,4866.41,47.0), type = "tomato" },
                    { cds = vector3(1926.67,4867.49,46.96), type = "tomato" },
                    { cds = vector3(1925.93,4868.27,46.96), type = "tomato" },
                    { cds = vector3(1924.89,4869.35,46.99), type = "tomato" },
                    { cds = vector3(1909.54,4884.34,47.2), type = "tomato" },
                    { cds = vector3(1908.7,4885.19,47.21), type = "tomato" },
                    { cds = vector3(1907.63,4886.16,47.22), type = "tomato" },
                    { cds = vector3(1906.25,4887.49,47.31), type = "tomato" },
                    { cds = vector3(1905.45,4888.26,47.34), type = "tomato" },
                    { cds = vector3(1904.51,4889.18,47.39), type = "tomato" },
                    { cds = vector3(1893.99,4867.01,46.2), type = "tomato" },
                    { cds = vector3(1895.02,4866.03,46.35), type = "tomato" },
                    { cds = vector3(1896.33,4865.15,46.33), type = "tomato" },
                    { cds = vector3(1896.81,4863.89,46.48), type = "tomato" },
                    { cds = vector3(1898.03,4863.05,46.53), type = "tomato" },
                    { cds = vector3(1898.88,4861.91,46.61), type = "tomato" },
                    { cds = vector3(1907.16,4853.61,46.83), type = "tomato" },
                    { cds = vector3(1908.08,4852.83,46.89), type = "tomato" },
                    { cds = vector3(1909.06,4852.11,46.9), type = "tomato" },
                    { cds = vector3(1910.12,4851.1,46.94), type = "tomato" },
                    { cds = vector3(1911.41,4850.05,46.91), type = "tomato" },
                    { cds = vector3(1912.61,4849.02,46.92), type = "tomato" },
                    { cds = vector3(1927.55,4834.42,46.01), type = "tomato" },
                    { cds = vector3(1928.28,4833.3,45.96), type = "tomato" },
                    { cds = vector3(1929.22,4832.31,45.89), type = "tomato" },
                    { cds = vector3(1930.31,4831.14,45.77), type = "tomato" },
                    { cds = vector3(1931.47,4829.94,45.66), type = "tomato" },
                    { cds = vector3(1932.47,4828.91,45.55), type = "tomato" },
                    { cds = vector3(1935.41,4816.16,44.47), type = "tomato" },
                    { cds = vector3(1934.29,4816.93,44.68), type = "tomato" },
                    { cds = vector3(1933.25,4817.93,44.82), type = "tomato" },
                    { cds = vector3(1931.95,4819.18,44.97), type = "tomato" },
                    { cds = vector3(1930.95,4820.12,45.07), type = "tomato" },
                    { cds = vector3(1929.92,4821.07,45.18), type = "tomato" },
                    { cds = vector3(1905.74,4841.16,46.44), type = "tomato" },
                    { cds = vector3(1904.49,4842.15,46.43), type = "tomato" },
                    { cds = vector3(1903.33,4843.27,46.41), type = "tomato" },
                    { cds = vector3(1902.22,4844.35,46.4), type = "tomato" },
                    { cds = vector3(1901.22,4845.32,46.38), type = "tomato" },
                    { cds = vector3(1900.3,4846.21,46.37), type = "tomato" },
                    { cds = vector3(1891.95,4854.5,46.05), type = "tomato" },
                    { cds = vector3(1891.18,4855.29,46.0), type = "tomato" },
                    { cds = vector3(1890.07,4856.41,45.89), type = "tomato" },
                    { cds = vector3(1889.03,4857.46,45.78), type = "tomato" },
                    { cds = vector3(1888.15,4858.35,45.69), type = "tomato" },
                    { cds = vector3(1887.16,4859.35,45.59), type = "tomato" },
                    { cds = vector3(1887.85,4849.65,45.8), type = "tomato" },
                    { cds = vector3(1889.18,4848.65,45.88), type = "tomato" },
                    { cds = vector3(1890.06,4847.64,45.93), type = "tomato" },
                    { cds = vector3(1891.06,4846.54,45.93), type = "tomato" },
                    { cds = vector3(1892.31,4845.33,45.93), type = "tomato" },
                    { cds = vector3(1893.29,4844.35,45.93), type = "tomato" },
                    { cds = vector3(1904.73,4830.6,45.56), type = "tomato" },
                    { cds = vector3(1905.87,4829.06,45.66), type = "tomato" },
                    { cds = vector3(1906.75,4828.16,45.66), type = "tomato" },
                    { cds = vector3(1907.85,4827.07,45.65), type = "tomato" },
                    { cds = vector3(1908.92,4826.01,45.65), type = "tomato" },
                    { cds = vector3(1909.99,4824.95,45.65), type = "tomato" },
                    { cds = vector3(1921.79,4813.79,44.68), type = "tomato" },
                    { cds = vector3(1922.8,4812.51,44.67), type = "tomato" },
                    { cds = vector3(1923.72,4811.41,44.6), type = "tomato" },
                    { cds = vector3(1924.7,4810.46,44.53), type = "tomato" },
                    { cds = vector3(1925.81,4809.16,44.39), type = "tomato" },
                    { cds = vector3(1926.7,4808.12,44.28), type = "tomato" },
                    { cds = vector3(1922.04,4803.13,44.17), type = "tomato" },
                    { cds = vector3(1921.15,4803.99,44.31), type = "tomato" },
                    { cds = vector3(1920.08,4805.06,44.41), type = "tomato" },
                    { cds = vector3(1919.05,4806.2,44.51), type = "tomato" },
                    { cds = vector3(1918.11,4807.24,44.59), type = "tomato" },
                    { cds = vector3(1917.22,4808.21,44.66), type = "tomato" },
                    { cds = vector3(1895.81,4831.07,45.93), type = "tomato" },
                    { cds = vector3(1894.59,4832.25,45.98), type = "tomato" },
                    { cds = vector3(1893.47,4833.26,45.97), type = "tomato" },
                    { cds = vector3(1892.33,4834.35,45.99), type = "tomato" },
                    { cds = vector3(1891.2,4835.42,45.96), type = "tomato" },
                    { cds = vector3(1890.14,4836.43,45.87), type = "tomato" },
                    { cds = vector3(1882.49,4843.83,45.34), type = "tomato" },
                    { cds = vector3(1881.02,4844.99,45.28), type = "tomato" },
                    { cds = vector3(1879.83,4845.94,45.24), type = "tomato" },
                    { cds = vector3(1878.78,4846.99,45.19), type = "tomato" },
                    { cds = vector3(1877.71,4848.06,45.13), type = "tomato" },
                    { cds = vector3(1876.72,4848.86,45.1), type = "tomato" },
                    { cds = vector3(1963.69,4827.54,44.09), type = "tomato" },
                    { cds = vector3(1964.83,4826.66,43.99), type = "tomato" },
                    { cds = vector3(1965.8,4825.7,43.9), type = "tomato" },
                    { cds = vector3(1966.96,4824.54,43.83), type = "tomato" },
                    { cds = vector3(1968.01,4823.5,43.79), type = "tomato" },
                    { cds = vector3(1968.99,4822.52,43.74), type = "tomato" },
                    { cds = vector3(1981.49,4809.23,43.0), type = "tomato" },
                    { cds = vector3(1982.67,4808.13,42.95), type = "tomato" },
                    { cds = vector3(1983.43,4807.36,42.91), type = "tomato" },
                    { cds = vector3(1984.59,4806.19,42.84), type = "tomato" },
                    { cds = vector3(1985.63,4805.14,42.75), type = "tomato" },
                    { cds = vector3(1986.79,4803.98,42.65), type = "tomato" },
                    { cds = vector3(1992.34,4808.41,42.66), type = "tomato" },
                    { cds = vector3(1991.42,4809.25,42.76), type = "tomato" },
                    { cds = vector3(1990.26,4810.29,42.89), type = "tomato" },
                    { cds = vector3(1988.92,4811.51,42.96), type = "tomato" },
                    { cds = vector3(1987.96,4812.55,43.08), type = "tomato" },
                    { cds = vector3(1986.92,4813.6,43.18), type = "tomato" },
                    { cds = vector3(1974.1,4826.75,43.72), type = "tomato" },
                    { cds = vector3(1972.85,4827.66,43.65), type = "tomato" },
                    { cds = vector3(1971.9,4828.77,43.68), type = "tomato" },
                    { cds = vector3(1970.75,4830.01,43.75), type = "tomato" },
                    { cds = vector3(1969.79,4830.96,43.85), type = "tomato" },
                    { cds = vector3(1968.72,4831.95,43.95), type = "tomato" },
                    { cds = vector3(1973.31,4837.05,43.98), type = "tomato" },
                    { cds = vector3(1974.53,4836.13,44.01), type = "tomato" },
                    { cds = vector3(1975.65,4835.33,44.09), type = "tomato" },
                    { cds = vector3(1976.8,4834.22,44.06), type = "tomato" },
                    { cds = vector3(1977.91,4833.12,44.04), type = "tomato" },
                    { cds = vector3(1978.89,4832.14,44.02), type = "tomato" },
                    { cds = vector3(1991.5,4818.98,43.41), type = "tomato" },
                    { cds = vector3(1992.72,4817.93,43.28), type = "tomato" },
                    { cds = vector3(1993.68,4816.84,43.14), type = "tomato" },
                    { cds = vector3(1994.63,4815.88,43.02), type = "tomato" },
                    { cds = vector3(1995.75,4814.73,42.87), type = "tomato" },
                    { cds = vector3(1996.81,4813.6,42.73), type = "tomato" },
                    { cds = vector3(2001.99,4817.79,42.58), type = "tomato" },
                    { cds = vector3(2000.95,4819.05,42.77), type = "tomato" },
                    { cds = vector3(1999.9,4820.15,42.9), type = "tomato" },
                    { cds = vector3(1998.74,4821.18,42.98), type = "tomato" },
                    { cds = vector3(1996.91,4822.71,43.08), type = "tomato" },
                    { cds = vector3(1984.18,4835.98,43.93), type = "tomato" },
                    { cds = vector3(1983.01,4837.01,43.9), type = "tomato" },
                    { cds = vector3(1981.95,4838.04,43.87), type = "tomato" },
                    { cds = vector3(1980.7,4839.16,43.83), type = "tomato" },
                    { cds = vector3(1979.78,4840.14,43.83), type = "tomato" },
                    { cds = vector3(1978.68,4841.21,43.83), type = "tomato" },
                    { cds = vector3(1987.58,4848.84,43.83), type = "tomato" },
                    { cds = vector3(1988.83,4848.35,44.01), type = "tomato" },
                    { cds = vector3(1989.64,4847.52,44.03), type = "tomato" },
                    { cds = vector3(1990.69,4846.44,44.0), type = "tomato" },
                    { cds = vector3(1991.8,4845.29,43.97), type = "tomato" },
                    { cds = vector3(1992.78,4844.27,43.95), type = "tomato" },
                    { cds = vector3(2002.09,4834.59,43.29), type = "tomato" },
                    { cds = vector3(2003.0,4833.59,43.24), type = "tomato" },
                    { cds = vector3(2003.87,4832.51,43.16), type = "tomato" },
                    { cds = vector3(2004.95,4831.29,43.01), type = "tomato" },
                    { cds = vector3(2006.12,4830.27,42.94), type = "tomato" },
                    { cds = vector3(2007.31,4829.27,42.84), type = "tomato" },
                    { cds = vector3(2286.3,4775.82,38.85), type = "tomato" },
                    { cds = vector3(2285.58,4773.82,38.88), type = "tomato" },
                    { cds = vector3(2284.06,4769.63,38.86), type = "tomato" },
                    { cds = vector3(2282.81,4766.16,38.87), type = "tomato" },
                    { cds = vector3(2282.68,4762.66,38.87), type = "tomato" },
                    { cds = vector3(2282.05,4760.53,38.84), type = "tomato" },
                    { cds = vector3(2281.17,4757.55,38.7), type = "tomato" },
                    { cds = vector3(2288.24,4755.43,38.55), type = "tomato" },
                    { cds = vector3(2288.72,4757.26,38.61), type = "tomato" },
                    { cds = vector3(2289.33,4759.36,38.64), type = "tomato" },
                    { cds = vector3(2290.01,4761.64,38.64), type = "tomato" },
                    { cds = vector3(2290.71,4764.04,38.62), type = "tomato" },
                    { cds = vector3(2291.16,4765.55,38.63), type = "tomato" },
                    { cds = vector3(2152.02,5015.21,41.29), type = "cow" },
                    { cds = vector3(2148.5,5012.18,41.32), type = "cow" },
                    { cds = vector3(2145.29,5007.37,41.31), type = "cow" },
                    { cds = vector3(2141.68,5005.59,41.31), type = "cow" },
                    { cds = vector3(2138.52,5000.51,41.41), type = "cow" },
                    { cds = vector3(2134.92,4998.39,41.39), type = "cow" },
                    { cds = vector3(2131.77,4992.06,41.31), type = "cow" },
                    { cds = vector3(2128.51,4989.41,41.26), type = "cow" },
                    { cds = vector3(2141.36,4973.41,41.36), type = "cow" },
                    { cds = vector3(2145.26,4976.11,41.45), type = "cow" },
                    { cds = vector3(2148.67,4980.52,41.33), type = "cow" },
                    { cds = vector3(2152.24,4983.36,41.38), type = "cow" },
                    { cds = vector3(2155.42,4988.18,41.28), type = "cow" },
                    { cds = vector3(2159.07,4990.93,41.33), type = "cow" },
                    { cds = vector3(2162.33,4995.49,41.31), type = "cow" },
                    { cds = vector3(2167.09,4997.7,41.32), type = "cow" },
                    { cds = vector3(2179.39,4987.96,41.35), type = "cow" },
                    { cds = vector3(2175.14,4985.17,41.3), type = "cow" },
                    { cds = vector3(2170.93,4980.92,41.3), type = "cow" },
                    { cds = vector3(2167.28,4980.06,41.31), type = "cow" },
                    { cds = vector3(2164.96,4973.32,41.31), type = "cow" },
                    { cds = vector3(2160.94,4971.34,41.31), type = "cow" },
                    { cds = vector3(2157.19,4966.95,41.34), type = "cow" },
                    { cds = vector3(2153.53,4963.66,41.34), type = "cow" },
                    { cds = vector3(2171.03,4944.43,41.29), type = "cow" },
                    { cds = vector3(2173.79,4947.44,41.35), type = "cow" },
                    { cds = vector3(2178.16,4951.25,41.29), type = "cow" },
                    { cds = vector3(2182.09,4954.05,41.28), type = "cow" },
                    { cds = vector3(2186.37,4958.32,41.29), type = "cow" },
                    { cds = vector3(2189.41,4960.28,41.29), type = "cow" },
                    { cds = vector3(2190.98,4966.71,41.26), type = "cow" },
                    { cds = vector3(2196.41,4969.31,41.37), type = "cow" },
                },
                
                pedlocations = {
                    vector4(2142.2077636719,4973.4487304688,41.355037689209,39.1637840271),
                    vector4(2145.8793945312,4976.400390625,41.410449981689,40.003898620605),
                    vector4(2149.4204101562,4980.6689453125,41.31861114502,40.324485778809),
                    vector4(2152.5686035156,4984.1245117188,41.321857452393,34.541309356689),
                    vector4(2156.2182617188,4988.2143554688,41.282131195068,34.818393707275),
                    vector4(2159.4724121094,4991.501953125,41.303470611572,37.719013214111),
                    vector4(2163.8215332031,4995.2963867188,41.279579162598,37.735469818115),
                    vector4(2167.453125,4998.3090820312,41.335597991943,42.428558349609),
                    vector4(2151.5378417969,5014.5478515625,41.331504821777,229.91923522949),
                    vector4(2148.0942382812,5011.59765625,41.320404052734,225.50621032715),
                    vector4(2144.6618652344,5007.1240234375,41.312702178955,216.36964416504),
                    vector4(2141.1806640625,5004.2358398438,41.296714782715,225.0929107666),
                    vector4(2137.2770996094,5000.1108398438,41.408092498779,231.1086730957),
                    vector4(2134.4020996094,4997.3564453125,41.350536346436,211.35810852051),
                    vector4(2130.6066894531,4992.0063476562,41.367427825928,225.74964904785),
                    vector4(2127.5170898438,4989.1586914062,41.246490478516,226.31944274902),
                    vector4(2153.2087402344,4963.0532226562,41.345920562744,226.96142578125),
                    vector4(2156.5461425781,4966.703125,41.415157318115,221.5193939209),
                    vector4(2160.8618164062,4970.4116210938,41.320701599121,224.14678955078),
                    vector4(2164.3674316406,4972.9428710938,41.36466217041,234.55307006836),
                    vector4(2166.837890625,4979.0170898438,41.27269744873,251.79699707031),
                    vector4(2170.3732910156,4980.5551757812,41.322002410889,225.17277526855),
                    vector4(2174.8798828125,4984.2319335938,41.319274902344,226.21501159668),
                    vector4(2178.6467285156,4987.7836914062,41.353168487549,224.20776367188),
                    vector4(2196.0290527344,4968.7827148438,41.371715545654,46.532001495361),
                    vector4(2191.8647460938,4966.8374023438,41.290023803711,49.560688018799),
                    vector4(2189.7485351562,4961.4165039062,41.266674041748,45.459411621094),
                    vector4(2186.0871582031,4957.6015625,41.28600692749,36.609550476074),
                    vector4(2182.3933105469,4954.771484375,41.297401428223,44.325836181641),
                    vector4(2179.1721191406,4951.1650390625,41.288139343262,48.308605194092),
                    vector4(2174.7980957031,4947.20703125,41.315006256104,43.852172851562),
                    vector4(2171.3037109375,4943.6352539062,41.277103424072,72.768539428711),
                },
            },

            ['scubaDiverConfig'] = {
                paymentType = {
                    money = false,
                    itens = true
                },
                
                minMoney = 50,
                maxMoney = 100,
                
                paymentItensType = 2,
                --  1 = todos itens
                --  2 = item randomico,
                
                paymentItens = {
                    {item = 'bronze', min = 1, max = 1}, 
                    {item = 'ferro', min = 1, max = 1},
                    {item = 'ouro', min = 1, max = 1},
                    {item = 'rubi', min = 1, max = 1},
                    {item = 'esmeralda', min = 1, max = 1},
                    {item = 'safira', min = 1, max = 1},
                    {item = 'diamante', min = 1, max = 1},
                    {item = 'topazio', min = 1, max = 1},
                    {item = 'ametista', min = 1, max = 1},
                },
                
                collectLocations = {
                    {vector3(-1753.62, -1084.97, -1.28)},
                    {vector3(-1724.35, -1108.49, -0.18)},
                    {vector3(-1723.42, -1059.0, 1.42)},
                    {vector3(-1754.31, -1087.09, -1.71)}
                },
                
                skillBar = false, -- Usar miniGame do SkillBar (true para sim false para não)
                
                resetTime = 60, -- tempo para respawnar o spot de mergulho
                
                jobVehicles = {
                    [`dinghy`] = true,
                },
                
                sonarType = 2, -- 1 para Item, 2 para Todos
                
                sonarBlipConfig = {
                    ['radius'] = 15.0,
                    ['colour'] = 15
                },
                
                scubaDiverMarker = {
                    ['type'] = 21,
                    ['scalex'] = 1.0,
                    ['scaley'] = 1.0,
                    ['scalez'] = 1.0,
                    ['r'] = 255,
                    ['g'] = 0,
                    ['b'] = 0,
                    ['a'] = 150,
                    ['bobUpAndDown'] = true,
                    ['rotate'] = true
                },
            }
        },

        -- Config do Ponto inicial do emprego de Mergulhador
        ['configScuba'] = {
            type = 'job',
            jobtype = 'scubaDiver',
            displayName = 'Mergulhador',
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'scuba'
                }
            },
            actionKey = 38,
            perm = "",

            -- Map Configuration
            blip = {
                name = 'Central | Mergulhador', -- Name to display on the map!
                blipId = 68, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },
    
        -- Config do Ponto inicial do emprego de Fazendeiro
        ['configFarmer'] = {
            type = 'job',
            jobtype = 'farmer',
            displayName = 'Fazendeiro',
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'farmer'
                }
            },
            actionKey = 38,
            perm = "",

            -- Map Configuration
            blip = {
                name = 'Central | Fazendeiro', -- Name to display on the map!
                blipId = 478, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },
    
        -- Config do Ponto inicial do emprego de Lixeiro V2
        ['configJobGarbagev2'] = {
            type = 'job',
            jobtype = 'garbage',
            displayName = 'Lixeiro',
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'garbage'
                }
            },
            actionKey = 38,
            perm = "",

            -- Map Configuration
            blip = {
                name = 'Central | Lixeiro', -- Name to display on the map!
                blipId = 318, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },
    },

    locs = {
        {showBlip = true, coord = vector3(-1820.33,-1220.37,13.11), heading = 359.29, config = 'configScuba'},
        {showBlip = true, coord = vector3(1966.84,4634.31,41.20), heading = 359.29, config = 'configFarmer'},
        {showBlip = true, coord = vector3(-350.77,-1567.60,25.22), heading = 359.29, config = 'configJobGarbagev2'},
    }
})