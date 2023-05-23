                      validator: (value) {
                        if (value == null) {
                          return '성별을 선택하세요';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: '흡연 여부',
                        border: OutlineInputBorder(),
                      ),
                      value: _isSmoking,
                      onChanged: (String? newValue) {
                        setState(() {
                          _isSmoking = newValue;
                        });
                      },
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: '흡연',
                          child: Text('흡연'),
                        ),
                        DropdownMenuItem<String>(
                          value: '비흡연',
                          child: Text('비흡연'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return '흡연 여부를 선택하세요';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _informationView();
                        }
                      },
                      child: Text('저장'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isFormVisible = !_isFormVisible;
          });
        },
        child: Icon(_isFormVisible ? Icons.remove : Icons.add),
      ),
    );
  }
}
