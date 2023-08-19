#include <vector>
#include <iostream>

namespace mat {
    template <typename T>
    class Vector {
        private:
            std::vector<T>  _data;

        public:
            Vector (std::vector<T>  data) {
                _data = data;
            }

            ~Vector() {};

            // utils
            size_t  getSize(void) {
                return _data.size();
            }

            T   &operator[](const size_t &i) {
                return _data[i];
            }
            
            int compareVector(Vector<T> vec2) {
                if (this->getSize() != vec2.getSize()) {
                    std::cerr << "Vector doesn't have the same size" << std::endl;
                    return (0);
                }

                for (size_t i = 0; i < this->getSize(); i++) {
                    if (_data[i] != vec2[i]) {
                        std::cerr << "Vector doesn't have the same value at index " << i << std::endl;
                        return (1);
                    }
                }

                return (0);
            }

            // Matrix  toMatrix(void) {
            //     Matrix  ret;

                
            // }

            void    print(void) {
                for (auto it : _data) {
                    std::cout << *it << std::endl;
                }
            }

            void    add(Vector<T> &rhs) {
                size_t i = 0;
                for (auto it: _data) {
                    *it += rhs[i];
                    i++;
                }
            }

            void    sub(Vector<T> &rhs) {
                size_t i = 0;
                for (auto it: _data) {
                    *it -= rhs[i];
                    i++;
                }
            }

            void    scal(T &rhs) {
                for (auto it: _data) {
                    *it *= rhs;
                }
            }

    };
}