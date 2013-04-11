use strict;
use warnings;

use Test::More tests => 1110;

use Crypt::Cipher::MULTI2;

my $key = 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
my $plaintext = '12345678';

my $expected_results = [
  { ciphertext => "313233340404040c", rounds => 1 },
  { ciphertext => "202320410404040c", rounds => 2 },
  { ciphertext => "2023204154597453", rounds => 3 },
  { ciphertext => "d79fe59754597453", rounds => 4 },
  { ciphertext => "d79fe59783c691c4", rounds => 5 },
  { ciphertext => "3fcd632383c691c4", rounds => 6 },
  { ciphertext => "3fcd63231e3e35d5", rounds => 7 },
  { ciphertext => "913362211e3e35d5", rounds => 8 },
  { ciphertext => "913362218f0d57f4", rounds => 9 },
  { ciphertext => "118eb1ed8f0d57f4", rounds => 10 },
  { ciphertext => "118eb1ed8a7ce3c0", rounds => 11 },
  { ciphertext => "17e343198a7ce3c0", rounds => 12 },
  { ciphertext => "17e343199d9fa0d9", rounds => 13 },
  { ciphertext => "fb7966e09d9fa0d9", rounds => 14 },
  { ciphertext => "fb7966e079100e17", rounds => 15 },
  { ciphertext => "8e6e5cad79100e17", rounds => 16 },
  { ciphertext => "8e6e5cadf77e52ba", rounds => 17 },
  { ciphertext => "69ddb2acf77e52ba", rounds => 18 },
  { ciphertext => "69ddb2ac2fe11114", rounds => 19 },
  { ciphertext => "28bf67362fe11114", rounds => 20 },
  { ciphertext => "28bf6736075e7622", rounds => 21 },
  { ciphertext => "b2a0c140075e7622", rounds => 22 },
  { ciphertext => "b2a0c14095ebb737", rounds => 23 },
  { ciphertext => "b7c146aa95ebb737", rounds => 24 },
  { ciphertext => "b7c146aa222af19d", rounds => 25 },
  { ciphertext => "d3e676c8222af19d", rounds => 26 },
  { ciphertext => "d3e676c8982518dc", rounds => 27 },
  { ciphertext => "99508a48982518dc", rounds => 28 },
  { ciphertext => "99508a4801759294", rounds => 29 },
  { ciphertext => "6922e87501759294", rounds => 30 },
  { ciphertext => "6922e87510ac424b", rounds => 31 },
  { ciphertext => "0206d73a10ac424b", rounds => 32 },
  { ciphertext => "0206d73a12aa9571", rounds => 33 },
  { ciphertext => "ac6c736912aa9571", rounds => 34 },
  { ciphertext => "ac6c73690cd2d329", rounds => 35 },
  { ciphertext => "3e77d36a0cd2d329", rounds => 36 },
  { ciphertext => "3e77d36a32a50043", rounds => 37 },
  { ciphertext => "049fe89232a50043", rounds => 38 },
  { ciphertext => "049fe892ec5c3a35", rounds => 39 },
  { ciphertext => "b10bfe73ec5c3a35", rounds => 40 },
  { ciphertext => "b10bfe735d57c446", rounds => 41 },
  { ciphertext => "7cc3d1a65d57c446", rounds => 42 },
  { ciphertext => "7cc3d1a60bcb27b8", rounds => 43 },
  { ciphertext => "f03697680bcb27b8", rounds => 44 },
  { ciphertext => "f0369768fbfdb0d0", rounds => 45 },
  { ciphertext => "6e3180e6fbfdb0d0", rounds => 46 },
  { ciphertext => "6e3180e621beeef4", rounds => 47 },
  { ciphertext => "aeb01e7b21beeef4", rounds => 48 },
  { ciphertext => "aeb01e7b8f0ef08f", rounds => 49 },
  { ciphertext => "2ebb7ef68f0ef08f", rounds => 50 },
  { ciphertext => "2ebb7ef609b63c94", rounds => 51 },
  { ciphertext => "ac37d1ec09b63c94", rounds => 52 },
  { ciphertext => "ac37d1eca581ed78", rounds => 53 },
  { ciphertext => "f6f9adfba581ed78", rounds => 54 },
  { ciphertext => "f6f9adfb76effd3d", rounds => 55 },
  { ciphertext => "9c8f4bf076effd3d", rounds => 56 },
  { ciphertext => "9c8f4bf0ea60b6cd", rounds => 57 },
  { ciphertext => "2e52b507ea60b6cd", rounds => 58 },
  { ciphertext => "2e52b5073acaf464", rounds => 59 },
  { ciphertext => "59a6f32d3acaf464", rounds => 60 },
  { ciphertext => "59a6f32d636c0749", rounds => 61 },
  { ciphertext => "21caaeec636c0749", rounds => 62 },
  { ciphertext => "21caaeec23e64201", rounds => 63 },
  { ciphertext => "ea8c933223e64201", rounds => 64 },
  { ciphertext => "ea8c9332c96ad133", rounds => 65 },
  { ciphertext => "af6db068c96ad133", rounds => 66 },
  { ciphertext => "af6db0684ae8e5b0", rounds => 67 },
  { ciphertext => "67e44ccf4ae8e5b0", rounds => 68 },
  { ciphertext => "67e44ccf2d0ca97f", rounds => 69 },
  { ciphertext => "7d87a63a2d0ca97f", rounds => 70 },
  { ciphertext => "7d87a63a4c648993", rounds => 71 },
  { ciphertext => "e83a05824c648993", rounds => 72 },
  { ciphertext => "e83a0582a45e8c11", rounds => 73 },
  { ciphertext => "af357fe5a45e8c11", rounds => 74 },
  { ciphertext => "af357fe55ee983f3", rounds => 75 },
  { ciphertext => "83b86c135ee983f3", rounds => 76 },
  { ciphertext => "83b86c13dd51efe0", rounds => 77 },
  { ciphertext => "b9e69443dd51efe0", rounds => 78 },
  { ciphertext => "b9e6944314f1b724", rounds => 79 },
  { ciphertext => "399913ce14f1b724", rounds => 80 },
  { ciphertext => "399913ce2d68a4ea", rounds => 81 },
  { ciphertext => "63d87f752d68a4ea", rounds => 82 },
  { ciphertext => "63d87f75e8076748", rounds => 83 },
  { ciphertext => "b9fafbe8e8076748", rounds => 84 },
  { ciphertext => "b9fafbe851fd9ca0", rounds => 85 },
  { ciphertext => "41f161e751fd9ca0", rounds => 86 },
  { ciphertext => "41f161e79bfc77b7", rounds => 87 },
  { ciphertext => "62442b8d9bfc77b7", rounds => 88 },
  { ciphertext => "62442b8df9b85c3a", rounds => 89 },
  { ciphertext => "2207de0cf9b85c3a", rounds => 90 },
  { ciphertext => "2207de0c5518f490", rounds => 91 },
  { ciphertext => "d97d990b5518f490", rounds => 92 },
  { ciphertext => "d97d990b8c656d9b", rounds => 93 },
  { ciphertext => "fd417b688c656d9b", rounds => 94 },
  { ciphertext => "fd417b68e0972300", rounds => 95 },
  { ciphertext => "87fbd9b0e0972300", rounds => 96 },
  { ciphertext => "87fbd9b0676cfab0", rounds => 97 },
  { ciphertext => "0c75a101676cfab0", rounds => 98 },
  { ciphertext => "0c75a101ed85f12c", rounds => 99 },
  { ciphertext => "f9ee9710ed85f12c", rounds => 100 },
  { ciphertext => "f9ee9710146b663c", rounds => 101 },
  { ciphertext => "c4a6fd96146b663c", rounds => 102 },
  { ciphertext => "c4a6fd96ef3644e1", rounds => 103 },
  { ciphertext => "0770b1abef3644e1", rounds => 104 },
  { ciphertext => "0770b1abe846f54a", rounds => 105 },
  { ciphertext => "d8433a77e846f54a", rounds => 106 },
  { ciphertext => "d8433a7719fd2eb5", rounds => 107 },
  { ciphertext => "0bac53c819fd2eb5", rounds => 108 },
  { ciphertext => "0bac53c812517d7d", rounds => 109 },
  { ciphertext => "a2e67edb12517d7d", rounds => 110 },
  { ciphertext => "a2e67edb281d3be8", rounds => 111 },
  { ciphertext => "42bf61ba281d3be8", rounds => 112 },
  { ciphertext => "42bf61ba6aa25a52", rounds => 113 },
  { ciphertext => "655329f56aa25a52", rounds => 114 },
  { ciphertext => "655329f54bc37be5", rounds => 115 },
  { ciphertext => "a99dc2454bc37be5", rounds => 116 },
  { ciphertext => "a99dc245e25eb9a0", rounds => 117 },
  { ciphertext => "928f4356e25eb9a0", rounds => 118 },
  { ciphertext => "928f435658199125", rounds => 119 },
  { ciphertext => "42c98ac558199125", rounds => 120 },
  { ciphertext => "42c98ac51ad01be0", rounds => 121 },
  { ciphertext => "b23949711ad01be0", rounds => 122 },
  { ciphertext => "b239497151e132f8", rounds => 123 },
  { ciphertext => "595a367e51e132f8", rounds => 124 },
  { ciphertext => "595a367e08bb0486", rounds => 125 },
  { ciphertext => "1015dcf408bb0486", rounds => 126 },
  { ciphertext => "1015dcf49893406b", rounds => 127 },
  { ciphertext => "02b2e91a9893406b", rounds => 128 },
  { ciphertext => "02b2e91a9a21a971", rounds => 129 },
  { ciphertext => "8cffc9539a21a971", rounds => 130 },
  { ciphertext => "8cffc953abe79088", rounds => 131 },
  { ciphertext => "217c9b8fabe79088", rounds => 132 },
  { ciphertext => "217c9b8f8a9b0b07", rounds => 133 },
  { ciphertext => "9594c5638a9b0b07", rounds => 134 },
  { ciphertext => "9594c563582e1944", rounds => 135 },
  { ciphertext => "4539b74d582e1944", rounds => 136 },
  { ciphertext => "4539b74d1d17ae09", rounds => 137 },
  { ciphertext => "ddb586a41d17ae09", rounds => 138 },
  { ciphertext => "ddb586a467d20179", rounds => 139 },
  { ciphertext => "84a2013067d20179", rounds => 140 },
  { ciphertext => "84a20130e3700049", rounds => 141 },
  { ciphertext => "7fbb3c76e3700049", rounds => 142 },
  { ciphertext => "7fbb3c76e7b34d8d", rounds => 143 },
  { ciphertext => "e1fc4befe7b34d8d", rounds => 144 },
  { ciphertext => "e1fc4bef064f0662", rounds => 145 },
  { ciphertext => "7bbbd065064f0662", rounds => 146 },
  { ciphertext => "7bbbd065250def8c", rounds => 147 },
  { ciphertext => "70f8fd97250def8c", rounds => 148 },
  { ciphertext => "70f8fd9755f5121b", rounds => 149 },
  { ciphertext => "bb67c87e55f5121b", rounds => 150 },
  { ciphertext => "bb67c87e7ddf7043", rounds => 151 },
  { ciphertext => "3643ed577ddf7043", rounds => 152 },
  { ciphertext => "3643ed574b9c9d14", rounds => 153 },
  { ciphertext => "9361f1774b9c9d14", rounds => 154 },
  { ciphertext => "9361f177c6289193", rounds => 155 },
  { ciphertext => "a3a9a964c6289193", rounds => 156 },
  { ciphertext => "a3a9a964658138f7", rounds => 157 },
  { ciphertext => "b98bceb3658138f7", rounds => 158 },
  { ciphertext => "b98bceb3703360dc", rounds => 159 },
  { ciphertext => "f14c1695703360dc", rounds => 160 },
  { ciphertext => "f14c1695817f7649", rounds => 161 },
  { ciphertext => "94b230a0817f7649", rounds => 162 },
  { ciphertext => "94b230a07e078d81", rounds => 163 },
  { ciphertext => "5c91731c7e078d81", rounds => 164 },
  { ciphertext => "5c91731c2296fe9d", rounds => 165 },
  { ciphertext => "138394952296fe9d", rounds => 166 },
  { ciphertext => "138394951412d88c", rounds => 167 },
  { ciphertext => "6fa6ba011412d88c", rounds => 168 },
  { ciphertext => "6fa6ba017bb4628d", rounds => 169 },
  { ciphertext => "56d60c237bb4628d", rounds => 170 },
  { ciphertext => "56d60c238bd99497", rounds => 171 },
  { ciphertext => "5beb6b048bd99497", rounds => 172 },
  { ciphertext => "5beb6b04d032ff93", rounds => 173 },
  { ciphertext => "824dbdf8d032ff93", rounds => 174 },
  { ciphertext => "824dbdf8d710d6c0", rounds => 175 },
  { ciphertext => "c9569860d710d6c0", rounds => 176 },
  { ciphertext => "c95698601e464ea0", rounds => 177 },
  { ciphertext => "940ca7941e464ea0", rounds => 178 },
  { ciphertext => "940ca794f489a56b", rounds => 179 },
  { ciphertext => "8ca11cd8f489a56b", rounds => 180 },
  { ciphertext => "8ca11cd87828b9b3", rounds => 181 },
  { ciphertext => "df319e777828b9b3", rounds => 182 },
  { ciphertext => "df319e77610878c0", rounds => 183 },
  { ciphertext => "23c0d1ed610878c0", rounds => 184 },
  { ciphertext => "23c0d1ed42c8a92d", rounds => 185 },
  { ciphertext => "3ba0e43942c8a92d", rounds => 186 },
  { ciphertext => "3ba0e43964b4aff9", rounds => 187 },
  { ciphertext => "7224142d64b4aff9", rounds => 188 },
  { ciphertext => "7224142d1690bbd4", rounds => 189 },
  { ciphertext => "58fc71cd1690bbd4", rounds => 190 },
  { ciphertext => "58fc71cd98aa658a", rounds => 191 },
  { ciphertext => "4be69e4498aa658a", rounds => 192 },
  { ciphertext => "4be69e44d34cfbce", rounds => 193 },
  { ciphertext => "ca0921c0d34cfbce", rounds => 194 },
  { ciphertext => "ca0921c0de28342a", rounds => 195 },
  { ciphertext => "62cfa4c7de28342a", rounds => 196 },
  { ciphertext => "62cfa4c7bce790ed", rounds => 197 },
  { ciphertext => "cfe04d24bce790ed", rounds => 198 },
  { ciphertext => "cfe04d24a86102cf", rounds => 199 },
  { ciphertext => "ae4c4cc6a86102cf", rounds => 200 },
  { ciphertext => "ae4c4cc6062d4e09", rounds => 201 },
  { ciphertext => "3e135d2b062d4e09", rounds => 202 },
  { ciphertext => "3e135d2b05d178ee", rounds => 203 },
  { ciphertext => "510781f005d178ee", rounds => 204 },
  { ciphertext => "510781f054d6f91e", rounds => 205 },
  { ciphertext => "39d629a554d6f91e", rounds => 206 },
  { ciphertext => "39d629a59ef00bb9", rounds => 207 },
  { ciphertext => "0ba107d19ef00bb9", rounds => 208 },
  { ciphertext => "0ba107d195510c68", rounds => 209 },
  { ciphertext => "ad1f893095510c68", rounds => 210 },
  { ciphertext => "ad1f8930cbc4d2f1", rounds => 211 },
  { ciphertext => "e1ca17dacbc4d2f1", rounds => 212 },
  { ciphertext => "e1ca17da2a0ec52b", rounds => 213 },
  { ciphertext => "12ca9e6c2a0ec52b", rounds => 214 },
  { ciphertext => "12ca9e6c24bd4d3e", rounds => 215 },
  { ciphertext => "ddb3e86324bd4d3e", rounds => 216 },
  { ciphertext => "ddb3e863f90ea55d", rounds => 217 },
  { ciphertext => "fbc09fc9f90ea55d", rounds => 218 },
  { ciphertext => "fbc09fc930548786", rounds => 219 },
  { ciphertext => "b864ba1d30548786", rounds => 220 },
  { ciphertext => "b864ba1d88303d9b", rounds => 221 },
  { ciphertext => "9946c87d88303d9b", rounds => 222 },
  { ciphertext => "9946c87def618ba6", rounds => 223 },
  { ciphertext => "5de8666bef618ba6", rounds => 224 },
  { ciphertext => "5de8666bb289edcd", rounds => 225 },
  { ciphertext => "99038383b289edcd", rounds => 226 },
  { ciphertext => "9903838338b57d71", rounds => 227 },
  { ciphertext => "f48b70e838b57d71", rounds => 228 },
  { ciphertext => "f48b70e8cc3e0d99", rounds => 229 },
  { ciphertext => "efdbb2dacc3e0d99", rounds => 230 },
  { ciphertext => "efdbb2dab1d340ef", rounds => 231 },
  { ciphertext => "7f3c8a58b1d340ef", rounds => 232 },
  { ciphertext => "7f3c8a58ceefcab7", rounds => 233 },
  { ciphertext => "b5bd8cc8ceefcab7", rounds => 234 },
  { ciphertext => "b5bd8cc8e460cdd0", rounds => 235 },
  { ciphertext => "725c098de460cdd0", rounds => 236 },
  { ciphertext => "725c098d963cc45d", rounds => 237 },
  { ciphertext => "eb4aab39963cc45d", rounds => 238 },
  { ciphertext => "eb4aab3915c2c5db", rounds => 239 },
  { ciphertext => "6fde7a1915c2c5db", rounds => 240 },
  { ciphertext => "6fde7a197a1cbfc2", rounds => 241 },
  { ciphertext => "bd764f8b7a1cbfc2", rounds => 242 },
  { ciphertext => "bd764f8b9ceab77c", rounds => 243 },
  { ciphertext => "dfe55a2b9ceab77c", rounds => 244 },
  { ciphertext => "dfe55a2b430fed57", rounds => 245 },
  { ciphertext => "d7d12cda430fed57", rounds => 246 },
  { ciphertext => "d7d12cdac761deab", rounds => 247 },
  { ciphertext => "2b6161f4c761deab", rounds => 248 },
  { ciphertext => "2b6161f4ec00bf5f", rounds => 249 },
  { ciphertext => "72dd64faec00bf5f", rounds => 250 },
  { ciphertext => "72dd64fa09260860", rounds => 251 },
  { ciphertext => "0d66ceef09260860", rounds => 252 },
  { ciphertext => "0d66ceef0440c68f", rounds => 253 },
  { ciphertext => "7facf3d10440c68f", rounds => 254 },
  { ciphertext => "7facf3d1e63cd0c7", rounds => 255 },
  { ciphertext => "e95bf46ae63cd0c7", rounds => 256 },
  { ciphertext => "e95bf46a0f6724ad", rounds => 257 },
  { ciphertext => "f9de2e340f6724ad", rounds => 258 },
  { ciphertext => "f9de2e3405cdf50d", rounds => 259 },
  { ciphertext => "96dd674205cdf50d", rounds => 260 },
  { ciphertext => "96dd67429310924f", rounds => 261 },
  { ciphertext => "6e8dcd049310924f", rounds => 262 },
  { ciphertext => "6e8dcd0426c3aa90", rounds => 263 },
  { ciphertext => "b71485ad26c3aa90", rounds => 264 },
  { ciphertext => "b71485ad91d72f3d", rounds => 265 },
  { ciphertext => "b0637abb91d72f3d", rounds => 266 },
  { ciphertext => "b0637abb046020e1", rounds => 267 },
  { ciphertext => "d7bd5e21046020e1", rounds => 268 },
  { ciphertext => "d7bd5e21d3dd7ec0", rounds => 269 },
  { ciphertext => "4b1330d7d3dd7ec0", rounds => 270 },
  { ciphertext => "4b1330d7d45a61d7", rounds => 271 },
  { ciphertext => "7699edddd45a61d7", rounds => 272 },
  { ciphertext => "7699eddda2c38c0a", rounds => 273 },
  { ciphertext => "8fd796ffa2c38c0a", rounds => 274 },
  { ciphertext => "8fd796ff3f960714", rounds => 275 },
  { ciphertext => "003c35653f960714", rounds => 276 },
  { ciphertext => "003c35653faa3271", rounds => 277 },
  { ciphertext => "a0cdf1a53faa3271", rounds => 278 },
  { ciphertext => "a0cdf1a5e3be2ea5", rounds => 279 },
  { ciphertext => "2ab02cb4e3be2ea5", rounds => 280 },
  { ciphertext => "2ab02cb4c90e0211", rounds => 281 },
  { ciphertext => "7ce3d0d4c90e0211", rounds => 282 },
  { ciphertext => "7ce3d0d43e9629db", rounds => 283 },
  { ciphertext => "f60f81a93e9629db", rounds => 284 },
  { ciphertext => "f60f81a9c899a872", rounds => 285 },
  { ciphertext => "64a53ba3c899a872", rounds => 286 },
  { ciphertext => "64a53ba332e33fa8", rounds => 287 },
  { ciphertext => "7292098232e33fa8", rounds => 288 },
  { ciphertext => "729209824071362a", rounds => 289 },
  { ciphertext => "1d5556fd4071362a", rounds => 290 },
  { ciphertext => "1d5556fd6ebd0c62", rounds => 291 },
  { ciphertext => "66fbe8dc6ebd0c62", rounds => 292 },
  { ciphertext => "66fbe8dc0846e4be", rounds => 293 },
  { ciphertext => "cbd6d7be0846e4be", rounds => 294 },
  { ciphertext => "cbd6d7bee3c7809f", rounds => 295 },
  { ciphertext => "417aa14de3c7809f", rounds => 296 },
  { ciphertext => "417aa14da2bd21d2", rounds => 297 },
  { ciphertext => "bbddeb87a2bd21d2", rounds => 298 },
  { ciphertext => "bbddeb8758efa34a", rounds => 299 },
  { ciphertext => "b5765b2e58efa34a", rounds => 300 },
  { ciphertext => "b5765b2eed99f864", rounds => 301 },
  { ciphertext => "48ced3a7ed99f864", rounds => 302 },
  { ciphertext => "48ced3a73e36a2ce", rounds => 303 },
  { ciphertext => "0616f2783e36a2ce", rounds => 304 },
  { ciphertext => "0616f278382050b6", rounds => 305 },
  { ciphertext => "ce1f7b21382050b6", rounds => 306 },
  { ciphertext => "ce1f7b2187f9774c", rounds => 307 },
  { ciphertext => "37c3af9287f9774c", rounds => 308 },
  { ciphertext => "37c3af92b03ad8de", rounds => 309 },
  { ciphertext => "0004b291b03ad8de", rounds => 310 },
  { ciphertext => "0004b29146b09cd1", rounds => 311 },
  { ciphertext => "793eb17f46b09cd1", rounds => 312 },
  { ciphertext => "793eb17f3f8e2dae", rounds => 313 },
  { ciphertext => "c3d61e5f3f8e2dae", rounds => 314 },
  { ciphertext => "c3d61e5f540d842d", rounds => 315 },
  { ciphertext => "35970b47540d842d", rounds => 316 },
  { ciphertext => "35970b47619a8f6a", rounds => 317 },
  { ciphertext => "ec0137cb619a8f6a", rounds => 318 },
  { ciphertext => "ec0137cbdd109deb", rounds => 319 },
  { ciphertext => "851b3ea4dd109deb", rounds => 320 },
  { ciphertext => "851b3ea4580ba34f", rounds => 321 },
  { ciphertext => "5ef12267580ba34f", rounds => 322 },
  { ciphertext => "5ef1226737528801", rounds => 323 },
  { ciphertext => "386b0a5c37528801", rounds => 324 },
  { ciphertext => "386b0a5c0f39825d", rounds => 325 },
  { ciphertext => "1ce9d2ee0f39825d", rounds => 326 },
  { ciphertext => "1ce9d2ee4ac39347", rounds => 327 },
  { ciphertext => "917106d24ac39347", rounds => 328 },
  { ciphertext => "917106d2dbb29595", rounds => 329 },
  { ciphertext => "88b0645bdbb29595", rounds => 330 },
  { ciphertext => "88b0645ba68e2c58", rounds => 331 },
  { ciphertext => "1a7439b7a68e2c58", rounds => 332 },
  { ciphertext => "1a7439b7bcfa15ef", rounds => 333 },
  { ciphertext => "b3ab70aabcfa15ef", rounds => 334 },
  { ciphertext => "b3ab70aaccd0d646", rounds => 335 },
  { ciphertext => "a470539fccd0d646", rounds => 336 },
  { ciphertext => "a470539f68a085d9", rounds => 337 },
  { ciphertext => "e5e26c1568a085d9", rounds => 338 },
  { ciphertext => "e5e26c1538f7592f", rounds => 339 },
  { ciphertext => "8b30523438f7592f", rounds => 340 },
  { ciphertext => "8b305234b3c70b1b", rounds => 341 },
  { ciphertext => "f39400efb3c70b1b", rounds => 342 },
  { ciphertext => "f39400ef8f7175aa", rounds => 343 },
  { ciphertext => "176a40c38f7175aa", rounds => 344 },
  { ciphertext => "176a40c3981b3569", rounds => 345 },
  { ciphertext => "0f888512981b3569", rounds => 346 },
  { ciphertext => "0f888512f2e8de9a", rounds => 347 },
  { ciphertext => "1f015c25f2e8de9a", rounds => 348 },
  { ciphertext => "1f015c25ede982bf", rounds => 349 },
  { ciphertext => "1e9266afede982bf", rounds => 350 },
  { ciphertext => "1e9266af470154fa", rounds => 351 },
  { ciphertext => "645ffa14470154fa", rounds => 352 },
  { ciphertext => "645ffa14235eaeee", rounds => 353 },
  { ciphertext => "f65e9571235eaeee", rounds => 354 },
  { ciphertext => "f65e9571bfbbe35d", rounds => 355 },
  { ciphertext => "e6f66474bfbbe35d", rounds => 356 },
  { ciphertext => "e6f66474594d8729", rounds => 357 },
  { ciphertext => "87898457594d8729", rounds => 358 },
  { ciphertext => "87898457900cc8ed", rounds => 359 },
  { ciphertext => "6f8f642c900cc8ed", rounds => 360 },
  { ciphertext => "6f8f642cff83acc1", rounds => 361 },
  { ciphertext => "130f9b6bff83acc1", rounds => 362 },
  { ciphertext => "130f9b6b2a25f205", rounds => 363 },
  { ciphertext => "37b4a1242a25f205", rounds => 364 },
  { ciphertext => "37b4a1241d915321", rounds => 365 },
  { ciphertext => "58491c921d915321", rounds => 366 },
  { ciphertext => "58491c92740a62a9", rounds => 367 },
  { ciphertext => "03b3fdb5740a62a9", rounds => 368 },
  { ciphertext => "03b3fdb577b99f1c", rounds => 369 },
  { ciphertext => "69b84d7577b99f1c", rounds => 370 },
  { ciphertext => "69b84d7510d1f81d", rounds => 371 },
  { ciphertext => "cfaf15b210d1f81d", rounds => 372 },
  { ciphertext => "cfaf15b2df7eedaf", rounds => 373 },
  { ciphertext => "47f873e5df7eedaf", rounds => 374 },
  { ciphertext => "47f873e51396502a", rounds => 375 },
  { ciphertext => "3e4ef74f1396502a", rounds => 376 },
  { ciphertext => "3e4ef74f2dd8a765", rounds => 377 },
  { ciphertext => "85fe3b772dd8a765", rounds => 378 },
  { ciphertext => "85fe3b77e02a51f2", rounds => 379 },
  { ciphertext => "372f2298e02a51f2", rounds => 380 },
  { ciphertext => "372f2298d705736a", rounds => 381 },
  { ciphertext => "4a8b0a0fd705736a", rounds => 382 },
  { ciphertext => "4a8b0a0f3acfd4a5", rounds => 383 },
  { ciphertext => "775d111d3acfd4a5", rounds => 384 },
  { ciphertext => "775d111d4d92c5b8", rounds => 385 },
  { ciphertext => "7a75e8c14d92c5b8", rounds => 386 },
  { ciphertext => "7a75e8c1a753977c", rounds => 387 },
  { ciphertext => "ecea9d61a753977c", rounds => 388 },
  { ciphertext => "ecea9d614bb90a1d", rounds => 389 },
  { ciphertext => "52f830604bb90a1d", rounds => 390 },
  { ciphertext => "52f8306015811635", rounds => 391 },
  { ciphertext => "d1b4528215811635", rounds => 392 },
  { ciphertext => "d1b45282c43544b7", rounds => 393 },
  { ciphertext => "fe7de60dc43544b7", rounds => 394 },
  { ciphertext => "fe7de60d850bcde1", rounds => 395 },
  { ciphertext => "15456391850bcde1", rounds => 396 },
  { ciphertext => "15456391904eae70", rounds => 397 },
  { ciphertext => "8101eb63904eae70", rounds => 398 },
  { ciphertext => "8101eb63de06cb5b", rounds => 399 },
  { ciphertext => "ece907fcde06cb5b", rounds => 400 },
  { ciphertext => "ece907fc32efcca7", rounds => 401 },
  { ciphertext => "5276549f32efcca7", rounds => 402 },
  { ciphertext => "5276549fc9817532", rounds => 403 },
  { ciphertext => "13f29eb0c9817532", rounds => 404 },
  { ciphertext => "13f29eb0da73eb82", rounds => 405 },
  { ciphertext => "bf2b5aefda73eb82", rounds => 406 },
  { ciphertext => "bf2b5aefe9e1b598", rounds => 407 },
  { ciphertext => "1604253fe9e1b598", rounds => 408 },
  { ciphertext => "1604253fffe590a7", rounds => 409 },
  { ciphertext => "7c516256ffe590a7", rounds => 410 },
  { ciphertext => "7c516256dc6ab578", rounds => 411 },
  { ciphertext => "dc4269dbdc6ab578", rounds => 412 },
  { ciphertext => "dc4269db0028dca3", rounds => 413 },
  { ciphertext => "97efb37e0028dca3", rounds => 414 },
  { ciphertext => "97efb37e9d5c5554", rounds => 415 },
  { ciphertext => "bd7b2d059d5c5554", rounds => 416 },
  { ciphertext => "bd7b2d0520277851", rounds => 417 },
  { ciphertext => "bc0da0bb20277851", rounds => 418 },
  { ciphertext => "bc0da0bb47d6ab94", rounds => 419 },
  { ciphertext => "05237aa147d6ab94", rounds => 420 },
  { ciphertext => "05237aa142f5d135", rounds => 421 },
  { ciphertext => "f9c7a69a42f5d135", rounds => 422 },
  { ciphertext => "f9c7a69ac5d2fe5e", rounds => 423 },
  { ciphertext => "0d224d37c5d2fe5e", rounds => 424 },
  { ciphertext => "0d224d37c8f0b369", rounds => 425 },
  { ciphertext => "50486eefc8f0b369", rounds => 426 },
  { ciphertext => "50486eef1bc676dd", rounds => 427 },
  { ciphertext => "8c95bc681bc676dd", rounds => 428 },
  { ciphertext => "8c95bc689753cab5", rounds => 429 },
  { ciphertext => "44aa3ca49753cab5", rounds => 430 },
  { ciphertext => "44aa3ca4ef469a0c", rounds => 431 },
  { ciphertext => "808dcab0ef469a0c", rounds => 432 },
  { ciphertext => "808dcab06fcb50bc", rounds => 433 },
  { ciphertext => "9f95411e6fcb50bc", rounds => 434 },
  { ciphertext => "9f95411e805160a3", rounds => 435 },
  { ciphertext => "4c012278805160a3", rounds => 436 },
  { ciphertext => "4c012278cc5042db", rounds => 437 },
  { ciphertext => "53825deccc5042db", rounds => 438 },
  { ciphertext => "53825dec41c8d4a3", rounds => 439 },
  { ciphertext => "333146e441c8d4a3", rounds => 440 },
  { ciphertext => "333146e472f99247", rounds => 441 },
  { ciphertext => "437874ba72f99247", rounds => 442 },
  { ciphertext => "437874bab14854ce", rounds => 443 },
  { ciphertext => "8b1f5c80b14854ce", rounds => 444 },
  { ciphertext => "8b1f5c803a57084e", rounds => 445 },
  { ciphertext => "3b4b89283a57084e", rounds => 446 },
  { ciphertext => "3b4b89288e1d2d0e", rounds => 447 },
  { ciphertext => "e5135c088e1d2d0e", rounds => 448 },
  { ciphertext => "e5135c086b0e7106", rounds => 449 },
  { ciphertext => "097689986b0e7106", rounds => 450 },
  { ciphertext => "097689980ab818cc", rounds => 451 },
  { ciphertext => "8ee375aa0ab818cc", rounds => 452 },
  { ciphertext => "8ee375aa845b6d66", rounds => 453 },
  { ciphertext => "7b598c58845b6d66", rounds => 454 },
  { ciphertext => "7b598c58d270744d", rounds => 455 },
  { ciphertext => "48a0b500d270744d", rounds => 456 },
  { ciphertext => "48a0b5009ad0c14d", rounds => 457 },
  { ciphertext => "39af63649ad0c14d", rounds => 458 },
  { ciphertext => "39af63643f89079d", rounds => 459 },
  { ciphertext => "b605c5233f89079d", rounds => 460 },
  { ciphertext => "b605c523898cc2be", rounds => 461 },
  { ciphertext => "5ae33c58898cc2be", rounds => 462 },
  { ciphertext => "5ae33c586aea5d90", rounds => 463 },
  { ciphertext => "74b9fbf26aea5d90", rounds => 464 },
  { ciphertext => "74b9fbf21e53a662", rounds => 465 },
  { ciphertext => "278a407c1e53a662", rounds => 466 },
  { ciphertext => "278a407c5695e8d2", rounds => 467 },
  { ciphertext => "25614c2d5695e8d2", rounds => 468 },
  { ciphertext => "25614c2d73f4a4ff", rounds => 469 },
  { ciphertext => "94c9ad5d73f4a4ff", rounds => 470 },
  { ciphertext => "94c9ad5db17aff29", rounds => 471 },
  { ciphertext => "1be442f9b17aff29", rounds => 472 },
  { ciphertext => "1be442f9aa9ebdd0", rounds => 473 },
  { ciphertext => "732217ecaa9ebdd0", rounds => 474 },
  { ciphertext => "732217ec82ddc2df", rounds => 475 },
  { ciphertext => "9370597e82ddc2df", rounds => 476 },
  { ciphertext => "9370597e11ad9ba1", rounds => 477 },
  { ciphertext => "5d6b96b911ad9ba1", rounds => 478 },
  { ciphertext => "5d6b96b99c9fc951", rounds => 479 },
  { ciphertext => "7b8e74d59c9fc951", rounds => 480 },
  { ciphertext => "7b8e74d5e711bd84", rounds => 481 },
  { ciphertext => "6217dc57e711bd84", rounds => 482 },
  { ciphertext => "6217dc573deec77e", rounds => 483 },
  { ciphertext => "e5b0b9fb3deec77e", rounds => 484 },
  { ciphertext => "e5b0b9fbd85e7e85", rounds => 485 },
  { ciphertext => "dcada54bd85e7e85", rounds => 486 },
  { ciphertext => "dcada54be1055b7e", rounds => 487 },
  { ciphertext => "a04c1805e1055b7e", rounds => 488 },
  { ciphertext => "a04c18054149437b", rounds => 489 },
  { ciphertext => "f481ec1f4149437b", rounds => 490 },
  { ciphertext => "f481ec1fbe93d4aa", rounds => 491 },
  { ciphertext => "fe614b99be93d4aa", rounds => 492 },
  { ciphertext => "fe614b9940f29f33", rounds => 493 },
  { ciphertext => "657291bc40f29f33", rounds => 494 },
  { ciphertext => "657291bc6f57e54e", rounds => 495 },
  { ciphertext => "210cffdc6f57e54e", rounds => 496 },
  { ciphertext => "210cffdc4e5b1a92", rounds => 497 },
  { ciphertext => "00b2e2d64e5b1a92", rounds => 498 },
  { ciphertext => "00b2e2d6109744ee", rounds => 499 },
  { ciphertext => "a4433a0a109744ee", rounds => 500 },
  { ciphertext => "a4433a0ab4d47ee4", rounds => 501 },
  { ciphertext => "ac004e06b4d47ee4", rounds => 502 },
  { ciphertext => "ac004e06df6a995a", rounds => 503 },
  { ciphertext => "d8dbbc9cdf6a995a", rounds => 504 },
  { ciphertext => "d8dbbc9c07b125c6", rounds => 505 },
  { ciphertext => "0559a7fa07b125c6", rounds => 506 },
  { ciphertext => "0559a7faf0ab55e7", rounds => 507 },
  { ciphertext => "000f8a42f0ab55e7", rounds => 508 },
  { ciphertext => "000f8a42f0a4dfa5", rounds => 509 },
  { ciphertext => "9ce9b85ff0a4dfa5", rounds => 510 },
  { ciphertext => "9ce9b85fe21e49a7", rounds => 511 },
  { ciphertext => "1eb7dc44e21e49a7", rounds => 512 },
  { ciphertext => "1eb7dc44fca995e3", rounds => 513 },
  { ciphertext => "d2edac19fca995e3", rounds => 514 },
  { ciphertext => "d2edac1915605c0f", rounds => 515 },
  { ciphertext => "6e32e09815605c0f", rounds => 516 },
  { ciphertext => "6e32e0987b52bc97", rounds => 517 },
  { ciphertext => "5244dc227b52bc97", rounds => 518 },
  { ciphertext => "5244dc222db27c53", rounds => 519 },
  { ciphertext => "ae07bd5a2db27c53", rounds => 520 },
  { ciphertext => "ae07bd5a83b5c109", rounds => 521 },
  { ciphertext => "28c977af83b5c109", rounds => 522 },
  { ciphertext => "28c977af93b9ed0b", rounds => 523 },
  { ciphertext => "1c5656c493b9ed0b", rounds => 524 },
  { ciphertext => "1c5656c48fefbbcf", rounds => 525 },
  { ciphertext => "98d930038fefbbcf", rounds => 526 },
  { ciphertext => "98d93003122d169f", rounds => 527 },
  { ciphertext => "ea7154f0122d169f", rounds => 528 },
  { ciphertext => "ea7154f0f85c426f", rounds => 529 },
  { ciphertext => "e98359c0f85c426f", rounds => 530 },
  { ciphertext => "e98359c001382b4b", rounds => 531 },
  { ciphertext => "b195016c01382b4b", rounds => 532 },
  { ciphertext => "b195016cb0ad2a27", rounds => 533 },
  { ciphertext => "6cfc4a1bb0ad2a27", rounds => 534 },
  { ciphertext => "6cfc4a1be1fb5f4a", rounds => 535 },
  { ciphertext => "ed539a51e1fb5f4a", rounds => 536 },
  { ciphertext => "ed539a510ca8c51b", rounds => 537 },
  { ciphertext => "71549f210ca8c51b", rounds => 538 },
  { ciphertext => "71549f2179d7df31", rounds => 539 },
  { ciphertext => "c260430d79d7df31", rounds => 540 },
  { ciphertext => "c260430dbbb79c3c", rounds => 541 },
  { ciphertext => "2c3def8bbbb79c3c", rounds => 542 },
  { ciphertext => "2c3def8b56c89542", rounds => 543 },
  { ciphertext => "e58c31af56c89542", rounds => 544 },
  { ciphertext => "e58c31afb344a4ed", rounds => 545 },
  { ciphertext => "ca395ca7b344a4ed", rounds => 546 },
  { ciphertext => "ca395ca7327eb3cc", rounds => 547 },
  { ciphertext => "844e5f95327eb3cc", rounds => 548 },
  { ciphertext => "844e5f95b630ec59", rounds => 549 },
  { ciphertext => "734ee5ebb630ec59", rounds => 550 },
  { ciphertext => "734ee5eb0ba7c6ca", rounds => 551 },
  { ciphertext => "214330210ba7c6ca", rounds => 552 },
  { ciphertext => "214330212ae4f6eb", rounds => 553 },
  { ciphertext => "05e5f6cf2ae4f6eb", rounds => 554 },
  { ciphertext => "05e5f6cfb0b69a3c", rounds => 555 },
];

for (@$expected_results) {
  is( unpack('H*', Crypt::Cipher::MULTI2->new($key, $_->{rounds})->encrypt($plaintext)), $_->{ciphertext}, "MULTI2->encrypt - rounds=$_->{rounds}");
  is( Crypt::Cipher::MULTI2->new($key, $_->{rounds})->decrypt(pack('H*', $_->{ciphertext})), $plaintext, "MULTI2->decrypt - rounds=$_->{rounds}");
}

#use Data::Dump 'pp';
#my @d;
#push @d, { rounds=>$_, ciphertext=>unpack('H*', Crypt::Cipher::MULTI2->new($key, $_)->encrypt($plain)) } for(1..555);
#print pp(\@d);