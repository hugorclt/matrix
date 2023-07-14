#include <vector>

template <typename T>
class Vector {
    private:
        std::vector<T>  _data;

    public:
        Vector (std::vector<T>  data) {
            _data.insert(data.first(), data.end());
        }

        ~Vector();

        // utils
        size_t  getSize(void) {
            return _data.size()
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
            for (auto it: _data) {
                *it += rhs //index de rhs
            }
        }

        void    sub(Vector<T> &rhs) {
            for (auto it: _data) {
                *it -= rhs //index de rhs
            }
        }

        void    scal(T &rhs) {
            for (auto it: _data) {
                *it *= rhs;
            }
        }

};