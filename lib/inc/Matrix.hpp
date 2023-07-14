#include <vector>

template <typename T>
class Matrix {
    private:
        std::vector<std::vector<T>>  _data;

    public:
        Matrix (std::vector<std::vector<T>>  data);
        Matrix (int sizeX, int sizeY, T data);

        ~Matrix();

        // utils
        size_t  getSize(void);
        Vector  toVector(void);
        void    print(void);
        bool    isSquare(void);

        void    add(Matrix<T> &rhs);
        void    subb(Matrix<T> &rhs);
        void    scal(T &rhs);

};